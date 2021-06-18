import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> registerUser(String email, String password) async {
    UserCredential _authResult =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());

    return _authResult;
  }

  Future<UserCredential> loginUser(String email, String password) async {
    UserCredential _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    return _authResult;
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
