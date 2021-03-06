import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/routes/routes.dart';
import 'package:andelinks/themes/themes.dart';
// import 'package:andelinks/ui/widgets/customWidgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:andelinks/utils/hexColor.dart';
import 'bindings/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put<ThemeController>(ThemeController(), permanent: true);
  // AwesomeNotifications().initialize(
  //     'resource://drawable/res_app_icon',
  //     [
  //       NotificationChannel(
  //           channelKey: 'basic_channel',
  //           channelName: 'Basic notifications',
  //           channelDescription: 'Notification channel for basic tests',
  //           defaultColor: Color(0xFF9D50DD),
  //           ledColor: Colors.white),
  //     ],
  //     debug: true);
  runApp(App());
  configLoading();
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print('background handler');
  print(message.data.toString());
  print(message.notification!.title);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ThemeController.to.getThemeModeFromStore();
    // return Loading(
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => WaterDropHeader(),
      enableLoadingWhenNoData: true,
      enableRefreshVibrate: true,
      enableLoadMoreVibrate: true,
      shouldFooterFollowWhenNotFull: (state) {
        return false;
      },
      child: GetMaterialApp(
        initialBinding: AuthBinding(),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: Routes.LOGIN,
        builder: EasyLoading.init(),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.black87
    ..indicatorColor = HexColor('#E6284A')
    ..textColor = Colors.white
    ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
