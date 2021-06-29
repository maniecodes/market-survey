import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/utils/hexColor.dart';

class CustomerTypePage extends StatelessWidget {
  const CustomerTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Type',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Customer Type',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.BORROWING_CUSTOMER),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        color: HexColor('#ffc4cf'),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.double_arrow,
                            size: 70,
                            color: Colors.black,
                          ),
                          Text(
                            'Target Saving Customers',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.SAVING_CUSTOMER),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        color: HexColor('#ffc4cf'),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money,
                            size: 70,
                            color: Colors.black,
                          ),
                          Text(
                            'Credit Sale Customers',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
