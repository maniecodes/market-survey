import 'package:get/get.dart';
import 'package:survey/controllers/authController.dart';
import 'package:survey/models/models.dart';
import 'package:survey/service/userService.dart';

class UserController extends GetxController {
  AuthController _auth = AuthController();
  UserService _userService = UserService();
  Rx<UserModel> _userModel = UserModel(firstName: '', lastName: '').obs;
  Rx<UserModel> _updatedUserModel = UserModel(firstName: '', lastName: '').obs;
  var isLoading = true.obs;

  UserModel get user => _userModel.value;

  UserModel get updatedUser => _updatedUserModel.value;

  set user(UserModel? value) => this._userModel.value;

  set updatedUser(UserModel? value) => this._updatedUserModel.value;

  getUserDetailsById(String? uid) async {
    try {
      return _userService.getUser(uid!);
    } catch (e) {
      print('got here na');
      print(e.toString());
    }
  }

  // current user
  getUserDetails() async {
    try {
      isLoading(true);
      print('isloading');
    
      print(_auth.getUser.uid);
      _userModel.value = await _userService.getUser(_auth.getUser.uid);
      isLoading(false);
    } catch (e) {
      print('failed to get user detail');
      print(e.toString());
    }
  }

  void clear() {
    _userModel.value = UserModel(firstName: '', lastName: '');
  }
}
