import 'package:flutter/material.dart';
import 'package:andelinks/ui/widgets/customWidgets.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController tx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: controller.registrationScaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0.0,
        title: Text('Sign up', style: Theme.of(context).textTheme.headline1),
        leading: GestureDetector(
          // onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 15),
            child: Form(
              // key: controller.registrationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextfieldWidget(
                            labelText: 'First Name',
                            controller: tx,
                            // onChanged: controller.firstNameChanged,
                            onSubmitted: (value) {},
                            hintText: 'Enter your firstname',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.account_balance_rounded,
                            // errorText: controller.fisrtNameErrorText.value,
                            validator: (value) {}),
                        // SizedBox(
                        //   height: SPACING,
                        // ),
                        CustomTextfieldWidget(
                          labelText: 'Last Name',
                          controller: tx,
                          //   onChanged: controller.lastNameChanged,
                          onSubmitted: (value) {},
                          hintText: 'Enter your lastname',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          // errorText: controller.lastNameErrorText.value,
                          validator: (value) {},
                        ),
                        // SizedBox(
                        //   height: SPACING,
                        // ),

                        CustomButtonWidget(
                            buttonName: 'Sign Up', onPressed: () {}),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              //onTap: () => Get.back(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text("Have an account? ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ),
                              ),
                            ),
                            GestureDetector(
                              //onTap: () => Get.back(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text("Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
