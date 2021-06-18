import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/ui/home.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
              ],
            ),
          ),
        );
      },
    );
  }
}
