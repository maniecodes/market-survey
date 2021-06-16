import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:survey/controllers/controllers.dart';

class LoginFormController extends GetxController {
  final AuthController _authController = Get.find();

  RxString email = ''.obs;
  RxString password = ''.obs;

  RxnString emailErrorText = RxnString(null);
  RxnString passwordErrorText = RxnString(null);
  Rxn<Function> submitFunc = Rxn<Function>(null);

  @override
  void onInit() {
    super.onInit();
    debounce(email, validations, time: Duration(microseconds: 400));
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

  void emailChanged(String val) => email.value = val;

  void passwordChanged(String val) => password.value = val;

  submitFunction() async =>
      await _authController.login(email.value, password.value);
}
