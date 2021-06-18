import 'package:get/get.dart';
import 'package:survey/controllers/authController.dart';
import 'package:survey/models/models.dart';
import 'package:survey/service/userService.dart';

class UserController extends GetxController {
  AuthController _auth = AuthController();
  UserService _userService = UserService();
  Rx<UserModel> _userModel = UserModel().obs;
  var isLoading = true.obs;

  UserModel get user => _userModel.value;

  set user(UserModel? value) => this._userModel.value;

  // Get user by id
  getUserDetails() async {
    try {
      isLoading(true);
      _userModel.value = await _userService.getUser(_auth.getUser.uid);
      isLoading(false);
    } catch (e) {
      print('got here na');
      print(e);
    }
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
