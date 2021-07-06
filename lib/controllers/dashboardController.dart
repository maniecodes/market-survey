import 'package:andelinks/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/models/survey.dart';
import 'package:andelinks/models/user.dart';
import 'package:andelinks/service/dashboardService.dart';
import 'package:andelinks/service/local_notification_service.dart';
import 'package:andelinks/service/userService.dart';

class DashboardController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<List<SurveyModel>> surveyList = Rxn<List<SurveyModel>>([]);
  Rxn<List<SurveyModel>> allSurveyList = Rxn<List<SurveyModel>>([]);
  DashboardService _dashboardService = DashboardService();
  List<SurveyModel>? get surveys => surveyList.value;
  List<SurveyModel>? get allSurveys => allSurveyList.value;
  RxInt tabIndex = 0.obs;
  UserService _userService = UserService();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxBool isEmailVerified = false.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    LocalNotificationService.initialize();
    User user = _auth.currentUser!;
    isEmailVerified = user.emailVerified.obs;
    await user.reload();
    FirebaseMessaging.instance.getInitialMessage();

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];

        print('gout in here');
        print(routeFromMessage);
        LocalNotificationService.display(message);
        // Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      print('foregorund');
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
      print(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      LocalNotificationService.display(message);
    });

    String uid = Get.find<AuthController>().getUser.uid;
    UserModel newUser = await _userService.getUser(uid);
    print('role is: ' + newUser.role.toString());
    if (newUser.role == 0) {
      allSurveyList.bindStream(_dashboardService.getAllSurvey()!);
      return;
    }

    surveyList.bindStream(_dashboardService.getSurverysByUserID(uid)!);
  }

  void onRefresh() async {
    onInit();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    print('loading');
    refreshController.loadComplete();
  }
}
