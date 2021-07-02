import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut<LoginFormController>(() => LoginFormController());
  }
}
