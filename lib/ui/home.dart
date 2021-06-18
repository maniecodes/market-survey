import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = Get.find<AuthController>().getUser;
  var user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: Get.put(UserController()),
      initState: (_) async {
        print('loadingng....');
        Get.find<UserController>().user = await user.getUserDetails();
        print('after loading...');
      },
      builder: (_userController) {
        return _userController.isLoading.value
            ? CircularProgressIndicator()
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0.0,
                  title: Text(_userController.user.firstName.toString()),
                ),
                drawer: Drawer(
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName:
                            Text(_userController.user.firstName.toString()),
                        accountEmail: Text(data.email!),
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
                              debugPrint(
                                  _userController.user.firstName.toString());
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
                      ),
                    ],
                  ),
                ),
                body: Container(
                  child: Text('${_userController.user.phone.toString()}'),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: FloatingActionButton(
                  isExtended: true,
                  child: Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    Get.toNamed(Routes.CUSTOMER_TYPE);
                  },
                ),
              );
      },
    );
  }
}
