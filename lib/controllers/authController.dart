import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/models.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/service/services.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  handleAuthChanged(_firebaseUser) async {
    if (_firebaseUser != null) {
      Get.offNamed(Routes.DASHBOARD);
    }
  }

  // Firebase user one=-time fetch
  User get getUser => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  // Method to handle user sign in using email and password
  Future<void> login(String email, String password) async {
    // showLoadingIndicator();
    EasyLoading.show(status: 'loading...');
    try {
      UserCredential _authResult =
          await _authService.loginUser(email.trim(), password.trim());
      if (_authResult.user != null) {
        // hideLoadingIndicator();
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Login Successful!');
        update();
        // Get.find<UserController>().user =
        //     await _userService.getUser(_authResult.user!.uid);
      }
    } catch (error) {
      // hideLoadingIndicator();
      EasyLoading.dismiss();
      Get.snackbar("Could not sign in", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // User Registration
  Future<void> register(String firstName, String lastName, String phone,
      String email, String password) async {
    EasyLoading.show(status: 'loading...');
    try {
      UserCredential _authResult =
          await _authService.registerUser(email, password);
      User user = _authResult.user!;
      if (_authResult.user != null) {
        UserModel _newUser = UserModel(
          uid: _authResult.user!.uid,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          email: _authResult.user!.email,
        );

        if (await _userService.createNewUser(_newUser)) {
          user = _auth.currentUser!;
          user.updateDisplayName(lastName + ' ' + firstName);
          await user.reload();
          EasyLoading.dismiss();
          //  EasyLoading.showSuccess('Great Success!');
          update();
        }

        Get.snackbar('Yeah! User Created Successfully', 'Go To Login',
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            backgroundColor: Colors.lightGreen,
            colorText: Get.theme.snackBarTheme.actionTextColor);
      }
    } catch (error) {
      // hideLoadingIndicator();
      EasyLoading.dismiss();
      Get.snackbar("Error creating account", error.toString(),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 7),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

  // Sign out
  void signOut() async {
    await _authService.signOutUser();
    Get.find<UserController>().clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
