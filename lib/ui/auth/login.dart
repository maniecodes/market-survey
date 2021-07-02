import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/routes/routes.dart';
import 'package:andelinks/ui/widgets/customPasswordField.dart';
import 'package:andelinks/ui/widgets/customWidgets.dart';

class LoginPage extends GetView<LoginFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.loginScaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            height: 20,
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
                              fontIcon: Icons.remove_red_eye,
                              //prefixIcon: Icons.security,
                              errorText: controller.passwordErrorText.value,
                              obscureText: controller.showPassword.value,
                              validator: (value) =>
                                  controller.validatePassword(value!),
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Text(
                                  "Forgot Password?",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          CustomButtonWidget(
                            buttonName: 'Login',
                            onPressed: controller.checkFormValidation,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.SIGN_UP),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Text("Don't have an account? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.SIGN_UP),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Text("Sign Up",
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
      ),
    );
  }
}
