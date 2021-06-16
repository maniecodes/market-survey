import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/models.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/services/services.dart';
import 'package:survey/ui/widgets/loading.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  // Firebase user one=-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

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

  // Method to handle user sign in using email and password
  Future<void> login(String email, String password) async {
    print('got here');
    print(email);
    print(password);
    showLoadingIndicator();
    try {
      UserCredential _authResult =
          await _authService.loginUser(email.trim(), password.trim());
      if (_authResult.user != null) {
        hideLoadingIndicator();
        Get.reset();
        update();
        // Get.find<UserController>().user =
        //     await _userService.getUser(_authResult.user!.uid);
      }
    } catch (error) {
      hideLoadingIndicator();
      Get.reset();
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
    showLoadingIndicator();
    try {
      UserCredential _authResult =
          await _authService.registerUser(email, password);
      if (_authResult.user != null) {
        UserModel _newUser = UserModel(
          id: _authResult.user!.uid,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          email: _authResult.user!.email,
        );
        if (await _userService.createNewUser(_newUser)) {
          // Get.find<UserController>().user = _newUser;
          hideLoadingIndicator();
          Get.reset();
          update();
        }

        Get.snackbar('Yeah! User Created Successfully', 'Go To Login',
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            backgroundColor: Colors.lightGreen,
            colorText: Get.theme.snackBarTheme.actionTextColor);
      }
    } catch (error) {
      hideLoadingIndicator();
      Get.reset();
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