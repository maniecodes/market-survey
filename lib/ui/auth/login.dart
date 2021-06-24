import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/ui/widgets/customPasswordField.dart';
import 'package:survey/ui/widgets/customWidgets.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginFormController _loginFormCtrl = Get.find();
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                              controller: emailController,
                              onChanged: _loginFormCtrl.emailChanged,
                              onSubmitted: (value) =>
                                  emailController.text = value,
                              hintText: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                              //prefixIcon: Icons.email,
                              errorText: _loginFormCtrl.emailErrorText.value,
                              
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return CustomPasswordfieldWidget(
                              labelText: 'Password',
                              controller: passwordController,
                              onChanged: _loginFormCtrl.passwordChanged,
                              onSubmitted: (value) =>
                                  passwordController.text = value,
                              hintText: 'Enter your passowrd',
                              keyboardType: TextInputType.name,
                              fontIcon: Icons.remove_red_eye,
                              //prefixIcon: Icons.security,
                              errorText: _loginFormCtrl.passwordErrorText.value,
                              obscureText: true,
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: null,
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
                            onPressed: _loginFormCtrl.submitFunction,
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
