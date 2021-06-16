import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:survey/controllers/controllers.dart';

class SignUpFormController extends GetxController {
  final AuthController _authController = Get.find();

  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString phone = ''.obs;

  RxnString fisrtNameErrorText = RxnString(null);
  RxnString lastNameErrorText = RxnString(null);
  RxnString phoneErrorText = RxnString(null);
  RxnString emailErrorText = RxnString(null);
  RxnString passwordErrorText = RxnString(null);
  Rxn<Function> submitFunc = Rxn<Function>(null);

  @override
  void onInit() {
    super.onInit();
    debounce(firstName, firstNameValidations,
        time: Duration(microseconds: 400));
    debounce(lastName, lastNameValidations, time: Duration(microseconds: 400));
    debounce(phone, phoneNameValidations, time: Duration(microseconds: 400));
    debounce(email, validations, time: Duration(microseconds: 400));
    debounce(password, passwordValidations, time: Duration(microseconds: 400));
  }

  void lastNameValidations(String val) async {
    lastNameErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      submitFunc.value = submitFunc;
      lastNameErrorText.value = null;
      return;
    }
    lastNameErrorText.value = "Last name is required";
  }

  void firstNameValidations(String val) async {
    fisrtNameErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      submitFunc.value = submitFunc;
      fisrtNameErrorText.value = null;
      return;
    }
    fisrtNameErrorText.value = "First name is required";
  }

  void phoneNameValidations(String val) async {
    phoneErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (val.length < 11) {
        phoneErrorText.value = "Must be at least 11 characters in length";
        return;
      }
      submitFunc.value = submitFunc;
      phoneErrorText.value = null;
      return;
    }
    phoneErrorText.value = "Phone number is required";
  }

  void validations(String val) async {
    emailErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty && EmailValidator.validate(val)) {
      submitFunc.value = submitFunc;
      emailErrorText.value = null;
      return;
    }
    emailErrorText.value = "Invalid email address";
  }

  void passwordValidations(String val) async {
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

  submitFunction() async => await _authController.register(firstName.value,
      lastName.value, phone.value, email.value, password.value);
}
