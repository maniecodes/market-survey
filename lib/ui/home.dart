import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/routes/routes.dart';

class HomePage extends GetWidget<AuthController> {
  final data = Get.find<AuthController>().getUser;
  final user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          title: GetX<UserController>(
            initState: (_) async {
              Get.find<UserController>().user = await user.getUserDetails();
            },
            builder: (_) {
              return Text(_.user.firstName.toString() +
                  ' ' +
                  _.user.lastName.toString());
            },
          )),
      drawer: Drawer(
        child: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user = await user.getUserDetails();
          },
          builder: (_) {
            return Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(_.user.firstName.toString()),
                  accountEmail: Text(_.user.email.toString()),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                      onTap: () async {
                        debugPrint(data.displayName.toString());
                      },
                    ),
                    ListTile(
                      title: Text('Create Survery'),
                      leading: Icon(Icons.favorite),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Change Password'),
                      leading: Icon(Icons.lock),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text('Logout'),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () => Get.find<AuthController>().signOut(),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
      body: Container(
        child: Text('${data.email.toString()}'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.toNamed(Routes.CUSTOMER_TYPE);
        },
      ),
    );
  }
}
