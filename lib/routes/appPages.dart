import 'package:get/route_manager.dart';
import 'package:survey/bindings/bindings.dart';
import 'package:survey/routes/appRoutes.dart';
import 'package:survey/ui/auth/login.dart';
import 'package:survey/ui/auth/register.dart';
import 'package:survey/ui/borrowingCustomer.dart';
import 'package:survey/ui/customerType.dart';
import 'package:survey/ui/dashboard.dart';
import 'package:survey/ui/savingCustomer.dart';
import 'package:survey/ui/surveyDetail.dart';

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
    )
  ];
}
