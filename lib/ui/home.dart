import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Welcome Manny,',
            style: Theme.of(context).textTheme.headline1),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Manasseh Liassidji'),
              accountEmail: Text('manassehl9@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {},
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
        child: Text('hey'),
      ),
    );
  }
}
