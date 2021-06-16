import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpFormController>(() => SignUpFormController());
  }
}
