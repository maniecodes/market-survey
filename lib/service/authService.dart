import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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

  Future<void> resetPassword(String email) async {
    print(email);
    try {
      print('sending reset');
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      EasyLoading.showSuccess("Check your email to reset your password");
      Get.back();
    } catch (error) {
      print('get inoto error');
      EasyLoading.showError(error.toString());
      // Get.snackbar("Error resetting password", error.toString(),
      //     snackPosition: SnackPosition.TOP,
      //     duration: Duration(seconds: 7),
      //     borderWidth: 1,
      //     borderColor: Colors.grey,
      //     backgroundColor: HexColor('#E6284A'),
      //     colorText: Colors.white);
      //
    }
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
