import 'package:get/get.dart';
import 'package:survey/controllers/authController.dart';
import 'package:survey/controllers/controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
   
  }
}
