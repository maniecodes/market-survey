import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/controllers/dashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<UserController>(UserController(), permanent: true);
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
