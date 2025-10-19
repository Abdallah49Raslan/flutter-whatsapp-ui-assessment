import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _auth;
  AuthRepo({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapError(e);
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapError(e);
    }
  }

  Future<String?> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapError(e);
    }
  }

  Future<void> logout() async => _auth.signOut();

  String _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email': return 'Invalid email address.';
      case 'user-disabled': return 'This user is disabled.';
      case 'user-not-found': return 'No user found with this email.';
      case 'wrong-password': return 'Wrong password.';
      case 'email-already-in-use': return 'Email already in use.';
      case 'weak-password': return 'Password too weak.';
      case 'too-many-requests': return 'Too many attempts. Try again later.';
      default: return e.message ?? 'Auth error: ${e.code}';
    }
  }
}
