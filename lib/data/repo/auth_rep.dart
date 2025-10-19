// lib/data/repo/auth_repo.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef Either<T> = ({T? right, String? left});

class AuthRepo {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;
  AuthRepo(this._auth, this._db);

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Future<Either<String>> sendOtp(String phone) async {
    try {
      String? verId;
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (id, _) => verId = id,
        verificationCompleted: (cred) async {
          await _auth.signInWithCredential(cred);
        },
        verificationFailed: (e) => throw e,
        codeAutoRetrievalTimeout: (id) => verId ??= id,
      );
      if (verId == null) return (left: 'Could not get verificationId', right: null);
      return (right: verId, left: null);
    } catch (e) {
      return (left: e.toString(), right: null);
    }
  }

  Future<Either<User>> verifyOtp(String verificationId, String smsCode) async {
    try {
      final cred = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final res = await _auth.signInWithCredential(cred);
      final u = res.user!;
      await _ensureUserDocument(u);
      return (right: u, left: null);
    } catch (e) {
      return (left: e.toString(), right: null);
    }
  }

  Future<void> _ensureUserDocument(User u) async {
    final ref = _db.collection('users').doc(u.uid);
    final snap = await ref.get();
    if (!snap.exists) {
      await ref.set({
        'phone': u.phoneNumber,
        'displayName': u.displayName ?? '',
        'photoUrl': u.photoURL ?? '',
        'about': 'Hey there! I am using WhatsApp clone',
        'isOnline': true,
        'lastSeen': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } else {
      await ref.update({'updatedAt': FieldValue.serverTimestamp()});
    }
  }

  Future<void> signOut() => _auth.signOut();
}
