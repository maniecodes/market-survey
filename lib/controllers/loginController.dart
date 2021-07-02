import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:andelinks/controllers/controllers.dart';

class LoginFormController extends GetxController {
  final AuthController _authController = Get.find();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController emailController, passwordController;

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool showPassword = true.obs;

  RxnString emailErrorText = RxnString(null);
  RxnString passwordErrorText = RxnString(null);

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateEmail(String val) {
    if (val.isEmpty && !EmailValidator.validate(val)) {
      return "Invalid email address";
    }
    return null;
  }

  String? validatePassword(String val) {
    if (val.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  void emailChanged(String val) => email.value = val;
  void passwordChanged(String val) => password.value = val;
  void passwordVisibility(bool val) => showPassword.value = !showPassword.value;

  void checkFormValidation() async {
    try {
      EasyLoading.show(status: "loading...");
      final isValid = loginFormKey.currentState!.validate();

      if (!isValid) {
        EasyLoading.showError('Some fields are required');
        return;
      }
      loginFormKey.currentState!.save();
      await _authController.login(email.value, password.value);
      // EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.dismiss();
      Get.snackbar("Could not save", error.toString(),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 7),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

  submitFunction() async =>
      await _authController.login(email.value, password.value);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
