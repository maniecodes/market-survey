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
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
            child: BottomNavigationBar(
                unselectedItemColor: Theme.of(context).primaryColorDark,
                selectedItemColor: Theme.of(context).primaryColor,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                items: [
                  _bottomNavigationBarItem(
                      icon: CupertinoIcons.home, label: 'Home'),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.creditcard,
                    label: 'Card',
                  ),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.qrcode,
                    label: 'Scan',
                  ),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.settings,
                    label: 'Settings',
                  ),
                ]),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
