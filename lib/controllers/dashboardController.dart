import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/survey.dart';
import 'package:survey/models/user.dart';
import 'package:survey/service/dashboardService.dart';
import 'package:survey/service/userService.dart';

class DashboardController extends GetxController {
  Rxn<List<SurveyModel>> surveyList = Rxn<List<SurveyModel>>([]);
  Rxn<List<SurveyModel>> allSurveyList = Rxn<List<SurveyModel>>([]);
  DashboardService _dashboardService = DashboardService();
  List<SurveyModel>? get surveys => surveyList.value;
  List<SurveyModel>? get allSurveys => allSurveyList.value;
  RxInt tabIndex = 0.obs;
  UserService _userService = UserService();

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    print('calling here');
    print(tabIndex);
    String uid = Get.find<AuthController>().getUser.uid;
    UserModel user = await _userService.getUser(uid);
    print('role is: ' + user.role.toString());
    if (user.role == 0) {
      allSurveyList.bindStream(_dashboardService.getAllSurvey()!);
      return;
    }

    surveyList.bindStream(_dashboardService.getSurverysByUserID(uid)!);
    print(surveyList);
    print(tabIndex);
  }
}
