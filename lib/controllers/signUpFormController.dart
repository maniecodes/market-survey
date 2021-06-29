import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:survey/controllers/controllers.dart';

class SignUpFormController extends GetxController {
  final AuthController _authController = Get.find();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> registrationScaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController firstNameController,
      lastNameController,
      phoneController,
      emailController,
      passwordController;

  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString phone = ''.obs;
  RxBool showPassword = true.obs;

  RxnString fisrtNameErrorText = RxnString(null);
  RxnString lastNameErrorText = RxnString(null);
  RxnString phoneErrorText = RxnString(null);
  RxnString emailErrorText = RxnString(null);
  RxnString passwordErrorText = RxnString(null);
  Rxn<Function> submitFunc = Rxn<Function>(null);

  @override
  void onInit() async {
    super.onInit();

    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateFirstName(String val) {
    if (val.isEmpty) {
      return "First name is required";
    }
    return null;
  }

  String? validateLastName(String val) {
    if (val.isEmpty) {
      return "Last name is required";
    }
    return null;
  }

  String? validatePhoneNumber(String val) {
    if (val.isEmpty) {
      return "Phone is required";
    }
    if (val.length < 11) {
      return "Must be at least 11 characters in length";
    }
    return null;
  }

  String? validateEmail(String val) {
    if (val.isEmpty || !EmailValidator.validate(val)) {
      return "Invalid email address";
    }
    return null;
  }

  String? validatePassword(String val) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regExp = new RegExp(pattern);
    if (val.isEmpty) {
      return "Password is required";
    }
    if (!regExp.hasMatch(val)) {
      if (val.length < 8) {
        return "Must be at least 8 characters in length";
      }
      return "Must contain at least one upper case, lower case, digit. ";
    }
  }

  void passwordValidations(String val)  {
    passwordErrorText.value = null;
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regExp = new RegExp(pattern);

    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (regExp.hasMatch(val)) {
        if (val.length < 8) {
          passwordErrorText.value = "Must be at least 8 characters in length";
          return;
        }
        submitFunc.value = submitFunc;
        passwordErrorText.value = null;
        return;
      }
      passwordErrorText.value =
          "Must contain at least one upper case, lower case, digit. ";
      return;
    }
  }

  void firstNameChanged(String val) => firstName.value = val;
  void lastNameChanged(String val) => lastName.value = val;
  void phoneChanged(String val) => phone.value = val;
  void emailChanged(String val) => email.value = val;
  void passwordChanged(String val) => password.value = val;
  void passwordVisibility(bool val) => showPassword.value = !showPassword.value;

  void checkFormValidation() async {
    try {
      EasyLoading.show(status: "loading...");
      final isValid = registrationFormKey.currentState!.validate();

      if (!isValid) {
        EasyLoading.showError('Some fields are required');
        return;
      }
      registrationFormKey.currentState!.save();
      await _authController.register(firstName.value, lastName.value,
          phone.value, email.value, password.value);
    } catch (error) {
      EasyLoading.dismiss();
      Get.snackbar("Could not save", error.toString(),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 7),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

  // submitFunction() async => await _authController.register(firstName.value,
  //     lastName.value, phone.value, email.value, password.value);

  @override
  void onClose() {
    super.onClose();
  }
}
