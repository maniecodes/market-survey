import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/ui/home.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.black,
    primary: Colors.black87,
    minimumSize: Size(40, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (_) async {
        Get.find<DashboardController>().tabIndex.value = 0;
      },
      builder: (controller) {
        print('why');
        print(controller.isEmailVerified.value);
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                controller.isEmailVerified.value
                    ? HomePage()
                    : Scaffold(
                        body: SafeArea(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                    'Check your email to verify your account.'),
                                TextButton(
                                    style: flatButtonStyle,
                                    onPressed: () =>
                                        Get.find<AuthController>().signOut(),
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
