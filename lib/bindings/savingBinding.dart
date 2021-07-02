import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';

class SavingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavingController>(() => SavingController());
  }
}
