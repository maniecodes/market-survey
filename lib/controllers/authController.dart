import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/models.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/service/services.dart';
import 'package:survey/utils/hexColor.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();
  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
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

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;

        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar(
            "Nework Error", 'You do not have access to an internet connection',
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
        break;
    }
  }

  bool isNetworkConnected() {
    print(connectionStatus.value);
    if (connectionStatus.value == 0) {
      Get.snackbar(
          "Nework Error", 'You do not have access to an internet connection',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 7),
          borderWidth: 1,
          borderColor: Colors.grey,
          backgroundColor: HexColor('#E6284A'),
          colorText: Colors.white);
      return false;
    }
    return true;
  }

  // Method to handle user sign in using email and password
  Future<void> login(String email, String password) async {
    if (isNetworkConnected()) {
      EasyLoading.show(status: 'loading...');
      try {
        UserCredential _authResult =
            await _authService.loginUser(email.trim(), password.trim());
        if (_authResult.user != null) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Login Successful!');
          update();
        }
      } on SocketException catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Error", error.message.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Could not sign in", error.message.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      }
    }
  }

  // User Registration
  Future<void> register(String firstName, String lastName, String phone,
      String email, String password) async {
    if (isNetworkConnected()) {
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
            update();
          }

          Get.snackbar('Yeah! User Created Successfully', 'Go To Login',
              snackPosition: SnackPosition.TOP,
              duration: Duration(seconds: 7),
              backgroundColor: Colors.lightGreen,
              colorText: Get.theme.snackBarTheme.actionTextColor);
        }
      } catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Error creating account", error.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      }
    }
  }

  // Sign out
  void signOut() async {
    await _authService.signOutUser();
    Get.find<UserController>().clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
