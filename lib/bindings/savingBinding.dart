import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';

class SavingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavingController>(() => SavingController());
  }
}
