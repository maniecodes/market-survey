import 'package:get/route_manager.dart';
import 'package:andelinks/bindings/bindings.dart';
import 'package:andelinks/routes/appRoutes.dart';
import 'package:andelinks/ui/auth/login.dart';
import 'package:andelinks/ui/auth/register.dart';
import 'package:andelinks/ui/borrowingCustomer.dart';
import 'package:andelinks/ui/customerType.dart';
import 'package:andelinks/ui/dashboard.dart';
import 'package:andelinks/ui/extSaleCustomer.dart';
import 'package:andelinks/ui/extSavingCustomer.dart';
import 'package:andelinks/ui/auth/forgotPassword.dart';
import 'package:andelinks/ui/savingCustomer.dart';
import 'package:andelinks/ui/surveyDetail.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => RegistrationPage(),
      binding: SignUpBinding(),
    ),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPassword()),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER_TYPE,
      page: () => CustomerTypePage(),
    ),
    GetPage(
      name: Routes.BORROWING_CUSTOMER,
      page: () => BorrowingCustomerPage(),
      binding: BorrowingBinding(),
    ),
    GetPage(
        name: Routes.SAVING_CUSTOMER,
        page: () => SavingCustomerPage(),
        binding: SavingBinding()),
    GetPage(
      name: Routes.VIEW_SURVERY,
      page: () => SurveyDetail(),
    ),
    GetPage(
      name: Routes.EXT_BORROWING_CUSTOMER,
      page: () => ExtSaleCustomerPage(),
      binding: BorrowingBinding(),
    ),
    GetPage(
        name: Routes.EXT_SAVING_CUSTOMER,
        page: () => ExtSavingCustomerPage(),
        binding: SavingBinding())
  ];
}
