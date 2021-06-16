import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginFormController>(() => LoginFormController());
  }
}
