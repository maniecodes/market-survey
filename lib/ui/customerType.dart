import 'package:flutter/material.dart';

class CustomerTypePage extends StatelessWidget {
  const CustomerTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Customer Type'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
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
                            Icons.whatshot_rounded,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('TBC'),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
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
                            Icons.fact_check_outlined,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('TSC'),
                          )
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
