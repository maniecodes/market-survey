import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/ui/widgets/customPasswordField.dart';
import 'package:andelinks/ui/widgets/customWidgets.dart';

class RegistrationPage extends GetView<SignUpFormController> {
  static const double SPACING = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.registrationScaffoldKey,
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
              key: controller.registrationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'First Name',
                            controller: controller.firstNameController,
                            onChanged: controller.firstNameChanged,
                            onSubmitted: (value) =>
                                controller.firstNameController.text = value,
                            hintText: 'Enter your firstname',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.account_balance_rounded,
                            errorText: controller.fisrtNameErrorText.value,
                            validator: (value) =>
                                controller.validateFirstName(value!),
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Last Name',
                            controller: controller.lastNameController,
                            onChanged: controller.lastNameChanged,
                            onSubmitted: (value) =>
                                controller.emailController.text = value,
                            hintText: 'Enter your lastname',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.account_balance_rounded,
                            errorText: controller.lastNameErrorText.value,
                            validator: (value) =>
                                controller.validateLastName(value!),
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Phone',
                            controller: controller.phoneController,
                            onChanged: controller.phoneChanged,
                            onSubmitted: (value) =>
                                controller.phoneController.text = value,
                            hintText: 'Enter your phone number',
                            keyboardType: TextInputType.number,
                            //prefixIcon: Icons.format_list_numbered,
                            errorText: controller.phoneErrorText.value,
                            validator: (value) =>
                                controller.validatePhoneNumber(value!),
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Email',
                            controller: controller.emailController,
                            onChanged: controller.emailChanged,
                            onSubmitted: (value) =>
                                controller.emailController.text = value,
                            hintText: 'Enter your email',
                            keyboardType: TextInputType.emailAddress,
                            //prefixIcon: Icons.email,
                            errorText: controller.emailErrorText.value,
                            validator: (value) =>
                                controller.validateEmail(value!),
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomPasswordfieldWidget(
                            onTap: () {
                              controller.showPassword.value =
                                  !controller.showPassword.value;
                            },
                            labelText: 'Password',
                            controller: controller.passwordController,
                            onChanged: controller.passwordChanged,
                            onSubmitted: (value) =>
                                controller.passwordController.text = value,
                            hintText: 'Enter your passowrd',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.security,
                            errorText: controller.passwordErrorText.value,
                            obscureText: controller.showPassword.value,
                            validator: (value) =>
                                controller.validatePassword(value!),
                          );
                        }),
                        SizedBox(
                          height: SPACING + 20,
                        ),
                        CustomButtonWidget(
                            buttonName: 'Sign Up',
                            onPressed: controller.checkFormValidation),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
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
                              onTap: () => Get.back(),
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
