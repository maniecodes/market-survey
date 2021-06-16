import 'package:get/route_manager.dart';
import 'package:survey/routes/appRoutes.dart';
import 'package:survey/ui/auth/login.dart';
import 'package:survey/ui/auth/register.dart';
import 'package:survey/ui/home.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => RegistrationPage(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => HomePage(),
    ),
  ];
}
