import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:andelinks/models/models.dart';
import 'package:andelinks/routes/routes.dart';
import 'package:andelinks/service/services.dart';
import 'package:andelinks/utils/hexColor.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> forgotPasswordEmailFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> forgotPasswordEmailScaffoldKey =
      GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();
  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  Rxn<User> firebaseUser = Rxn<User>();
  // RxBool isEmailVerified = false.obs;
  late TextEditingController forgotPassEmailController;

  RxString forgotPassEmail = ''.obs;
  RxnString forgotPassEmailErrorText = RxnString(null);

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    forgotPassEmailController = TextEditingController();
    // User isEmailVerified = _auth.currentUser!..reload();
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

  void forgotPassEmailChanged(String val) => forgotPassEmail.value = val;
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

  String? validateforgotPassEmail(String val) {
    print('validateforgotPassEmailChanged');
    print(val);
    if (val.isEmpty || !EmailValidator.validate(val)) {
      print('error');
      return "Invalid email address";
    }
    return null;
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
      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Could not sign in", error.message.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      } catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Could not sign in", error.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      }
    }
  }

  void checkVerification() async {
    User user = _auth.currentUser!..reload();
    EasyLoading.show(status: 'requesting...');

    print(user);
    if (user.emailVerified) {
      EasyLoading.dismiss();
      update();
      Get.offAllNamed(Routes.DASHBOARD);
      EasyLoading.showSuccess('Welcome to Andelinks');
    } else {
      try {
        await user.sendEmailVerification();
        Future.delayed(Duration(milliseconds: 3000)).then((_) =>
            EasyLoading.showSuccess('Email verification sent succesfully'));
        await user.reload();
        update();
      } catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Error sending verification email", error.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      }
    }
    EasyLoading.dismiss();
  }

  resetPassword() async {
    print('moveee');
    if (isNetworkConnected()) {
      EasyLoading.show(status: 'loading...');
      try {
        final isValid = forgotPasswordEmailFormKey.currentState!.validate();
        print(isValid);
        if (!isValid) {
          EasyLoading.showError('Email field is required');
          return;
        }
        await _authService.resetPassword(forgotPassEmail.value);
      } catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Error resetting password", error.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
      }
    } else {
      EasyLoading.showError('No network');
    }
  }

  // User Registration
  Future<void> register(String firstName, String lastName, String phone,
      String email, String password) async {
    if (isNetworkConnected()) {
      EasyLoading.show(status: 'loading...');
      try {
        // Get the token for this device
        String? fcmToken = await _fcm.getToken();

        print('my token');

        if (fcmToken != null) {
          UserCredential _authResult =
              await _authService.registerUser(email, password);
          User user = _authResult.user!;
          print(user.emailVerified);
          if (!user.emailVerified) {
            print('sending email');

            if (_authResult.user != null) {
              UserModel _newUser = UserModel(
                  uid: _authResult.user!.uid,
                  firstName: firstName,
                  lastName: lastName,
                  phone: phone,
                  email: _authResult.user!.email,
                  token: fcmToken,
                  role: 1);

              if (await _userService.createNewUser(_newUser)) {
                user = _auth.currentUser!;
                user.updateDisplayName(lastName + ' ' + firstName);
                EasyLoading.showSuccess("Account created");
                await user.sendEmailVerification();
                await user.reload();
                EasyLoading.dismiss();
                update();
              }
              EasyLoading.dismiss();
            } else {
              EasyLoading.dismiss();
              Get.snackbar("Error sending verification message", 'not',
                  snackPosition: SnackPosition.TOP,
                  duration: Duration(seconds: 7),
                  borderWidth: 1,
                  borderColor: Colors.grey,
                  backgroundColor: HexColor('#E6284A'),
                  colorText: Colors.white);
            }

            print('sent email');
          }
        }
      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Error creating account", error.message.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            borderWidth: 1,
            borderColor: Colors.grey,
            backgroundColor: HexColor('#E6284A'),
            colorText: Colors.white);
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
    print('here');
    await _authService.signOutUser();
    Get.reset();
    Get.offAllNamed(Routes.LOGIN);
    update();
  }

  @override
  void onClose() {
    forgotPassEmailController.dispose();
    super.onClose();
  }
}
