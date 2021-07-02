import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';

class BorrowingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BorrowingController>(() => BorrowingController());
  }
}
