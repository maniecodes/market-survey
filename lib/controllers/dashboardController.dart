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
    print('is user email verified?');
    print(isEmailVerified);
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
      print('opened');
      final routeFromMessage = message.data["route"];
      LocalNotificationService.display(message);
      print(routeFromMessage);
    });

    print('calling here');
    print(tabIndex);
    String uid = Get.find<AuthController>().getUser.uid;
    UserModel newUser = await _userService.getUser(uid);
    print('role is: ' + newUser.role.toString());
    if (newUser.role == 0) {
      allSurveyList.bindStream(_dashboardService.getAllSurvey()!);
      return;
    }

    surveyList.bindStream(_dashboardService.getSurverysByUserID(uid)!);
    print(surveyList);
    print(tabIndex);
  }

  void onRefresh() async {
    onInit();
    print(Get.find<AuthController>().firebaseUser.value!.emailVerified);
    print('refreshing');
    // monitor network fetch
    User updatedUser = _auth.currentUser!..reload();
    isEmailVerified = updatedUser.emailVerified.obs;
    // print(isEmailVerified);

    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void onLoading() async {
    print('loading');
    // monitor network fetch
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // User user = _auth.currentUser!;

    // isEmailVerified = user.emailVerified.obs;
    // print('is user email verified?');
    // print(isEmailVerified);

    // String uid = Get.find<AuthController>().getUser.uid;
    // UserModel newUser = await _userService.getUser(uid);

    // print('role is: ' + newUser.role.toString());
    // await user.reload();
    // if (newUser.role == 0) {
    //   allSurveyList.bindStream(_dashboardService.getAllSurvey()!);
    //   return;
    // }

    // surveyList.bindStream(_dashboardService.getSurverysByUserID(uid)!);
    // print(surveyList);
    // print(tabIndex);

    refreshController.loadComplete();
  }
}
