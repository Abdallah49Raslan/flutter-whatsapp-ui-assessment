// lib/data/repo/auth_repo.dart
import 'dart:async';
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
      final completer = Completer<String>();

      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        // لو الجهاز قدر يعمل auto-verification (instant validation/auto-retrieval)
        verificationCompleted: (PhoneAuthCredential cred) async {
          try {
            await _auth.signInWithCredential(cred);
            // في الحالة دي مش هنحتاج OTP، لكن علشان نكمل الفلو ندي قيمة placeholder
            if (!completer.isCompleted) completer.complete('AUTO_VERIFIED');
          } catch (e) {
            if (!completer.isCompleted) completer.completeError(e);
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) completer.completeError(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          if (!completer.isCompleted) completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // أحيانًا بيوصل الـid هنا بس برضه ينفع نستخدمه
          if (!completer.isCompleted) completer.complete(verificationId);
        },
      );

      final verId = await completer.future.timeout(const Duration(seconds: 60));
      return (right: verId, left: null);
    } catch (e) {
      return (left: e.toString(), right: null);
    }
  }

  Future<Either<User>> verifyOtp(String verificationId, String smsCode) async {
    try {
      // لو جه AUTO_VERIFIED، مش هنحتاج SMS code
      if (verificationId == 'AUTO_VERIFIED') {
        final user = _auth.currentUser;
        if (user != null) {
          await _ensureUserDocument(user);
          return (right: user, left: null);
        }
      }
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
