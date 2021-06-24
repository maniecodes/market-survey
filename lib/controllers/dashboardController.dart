import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/survey.dart';
import 'package:survey/service/dashboardService.dart';

class DashboardController extends GetxController {
  Rxn<List<SurveyModel>> surveyList = Rxn<List<SurveyModel>>([]);
  DashboardService _dashboardService = DashboardService();
  List<SurveyModel>? get surveys => surveyList.value;
  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print('calling here');
    print(tabIndex);
    String uid = Get.find<AuthController>().getUser.uid;
    print(uid);
    surveyList.bindStream(_dashboardService.getSurverysByUserID(uid)!);
    print(surveyList);
    print(tabIndex);
  }
}
