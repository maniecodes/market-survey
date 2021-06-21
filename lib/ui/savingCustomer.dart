import 'package:flutter/material.dart';

class SavingCustomerPage extends StatelessWidget {
  const SavingCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Saving Customer'),
      ),
      body: Container(
        child: Text('hi'),
      ),
    );
  }
}
