import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepo {
  final FirebaseFirestore _db;
  final String currentUid;
  ChatRepo(this._db, this.currentUid);

  String privateChatId(String uidA, String uidB) {
    final a = uidA.compareTo(uidB) <= 0 ? uidA : uidB;
    final b = uidA.compareTo(uidB) <= 0 ? uidB : uidA;
    return '${a}_$b';
  }

  Future<void> ensurePrivateChat(String otherUid) async {
    final id = privateChatId(currentUid, otherUid);
    final ref = _db.collection('chats').doc(id);
    final snap = await ref.get();
    if (!snap.exists) {
      await ref.set({
        'members': [currentUid, otherUid],
        'isGroup': false,
        'createdAt': FieldValue.serverTimestamp(),
        'lastMessage': null,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchUserChats() {
    return _db.collection('chats')
      .where('members', arrayContains: currentUid)
      .orderBy('updatedAt', descending: true)
      .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchMessages(String chatId, {int limit = 30}) {
    return _db.collection('chats').doc(chatId).collection('messages')
      .orderBy('timestamp', descending: true).limit(limit).snapshots();
  }

  Future<void> sendText({required String chatId, required String text}) async {
    final chatRef = _db.collection('chats').doc(chatId);
    final msgRef = chatRef.collection('messages').doc();
    final now = FieldValue.serverTimestamp();
    await _db.runTransaction((tx) async {
      tx.set(msgRef, {
        'messageId': msgRef.id,
        'senderId': currentUid,
        'text': text,
        'type': 'text',
        'timestamp': now,
        'deliveredTo': {},
        'seenBy': {},
      });
      tx.update(chatRef, {
        'lastMessage': {
          'text': text,
          'senderId': currentUid,
          'type': 'text',
          'timestamp': now,
        },
        'updatedAt': now,
      });
    });
  }

  Future<void> markSeen(String chatId, Iterable<String> messageIds) async {
    final batch = _db.batch();
    for (final id in messageIds) {
      final ref = _db.collection('chats').doc(chatId).collection('messages').doc(id);
      batch.update(ref, {'seenBy.$currentUid': FieldValue.serverTimestamp()});
    }
    await batch.commit();
  }
}
