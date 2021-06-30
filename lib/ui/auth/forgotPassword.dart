import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/ui/widgets/customWidgets.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AuthController>();
    return Scaffold(
      key: controller.forgotPasswordEmailScaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0.0,
        title: Text('Sign up', style: Theme.of(context).textTheme.headline1),
        leading: GestureDetector(
          onTap: () => Get.back(),
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
              key: controller.forgotPasswordEmailFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reset your password"),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Email',
                            controller: controller.forgotPassEmailController,
                            onChanged: controller.forgotPassEmailChanged,
                            onSubmitted: (value) => controller
                                .forgotPassEmailController.text = value,
                            hintText: 'Enter your registered email',
                            keyboardType: TextInputType.emailAddress,
                            //prefixIcon: Icons.account_balance_rounded,
                            errorText:
                                controller.forgotPassEmailErrorText.value,
                            validator: (value) =>
                                controller.validateforgotPassEmail(value!),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButtonWidget(
                            buttonName: 'Reset Password',
                            onPressed: controller.resetPassword),
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
