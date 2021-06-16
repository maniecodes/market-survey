import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/themes/themes.dart';
import 'package:survey/ui/widgets/customWidgets.dart';

import 'bindings/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController(), permanent: true);
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return Loading(
      child: GetMaterialApp(
        initialBinding: AuthBinding(),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: Routes.LOGIN,
      ),
    );
  }
}
