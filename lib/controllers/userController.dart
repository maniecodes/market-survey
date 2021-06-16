import 'package:get/get.dart';
import 'package:survey/models/models.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;
  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value;

  void clear() {
    _userModel.value = UserModel();
  }
}
