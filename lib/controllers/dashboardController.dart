import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/survey.dart';
import 'package:survey/models/user.dart';
import 'package:survey/service/dashboardService.dart';
import 'package:survey/service/local_notification_service.dart';
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
    LocalNotificationService.initialize();

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
      print('opened');
      final routeFromMessage = message.data["route"];
      LocalNotificationService.display(message);
      print(routeFromMessage);
    });

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
