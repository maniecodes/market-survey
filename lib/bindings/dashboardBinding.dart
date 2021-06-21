import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/controllers/dashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
