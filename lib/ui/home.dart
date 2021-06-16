import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0.0,
        title: Text('Welcome Manny,',
            style: Theme.of(context).textTheme.headline1),
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      body: Container(
        child: Text('hey'),
      ),
    );
  }
}
