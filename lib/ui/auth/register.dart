import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/ui/widgets/customWidgets.dart';

class RegistrationPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const double SPACING = 10.0;

  @override
  Widget build(BuildContext context) {
    SignUpFormController _signUpFormCtrl = Get.put(SignUpFormController());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0.0,
        title: Text('Sign up', style: Theme.of(context).textTheme.headline1),
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColorDark,
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
              key: _formKey,
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
                            controller: firstNameController,
                            onChanged: _signUpFormCtrl.firstNameChanged,
                            onSubmitted: (value) =>
                                firstNameController.text = value,
                            hintText: 'Enter your firstname',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.account_balance_rounded,
                            errorText: _signUpFormCtrl.fisrtNameErrorText.value,
                            obscureText: false,
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Last Name',
                            controller: lastNameController,
                            onChanged: _signUpFormCtrl.lastNameChanged,
                            onSubmitted: (value) =>
                                emailController.text = value,
                            hintText: 'Enter your lastname',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.account_balance_rounded,
                            errorText: _signUpFormCtrl.lastNameErrorText.value,
                            obscureText: false,
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Phone',
                            controller: phoneController,
                            onChanged: _signUpFormCtrl.phoneChanged,
                            onSubmitted: (value) =>
                                phoneController.text = value,
                            hintText: 'Enter your phone number',
                            keyboardType: TextInputType.number,
                            //prefixIcon: Icons.format_list_numbered,
                            errorText: _signUpFormCtrl.phoneErrorText.value,
                            obscureText: false,
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Email',
                            controller: emailController,
                            onChanged: _signUpFormCtrl.emailChanged,
                            onSubmitted: (value) =>
                                emailController.text = value,
                            hintText: 'Enter your email',
                            keyboardType: TextInputType.emailAddress,
                            //prefixIcon: Icons.email,
                            errorText: _signUpFormCtrl.emailErrorText.value,
                            obscureText: false,
                          );
                        }),
                        SizedBox(
                          height: SPACING,
                        ),
                        Obx(() {
                          return CustomTextfieldWidget(
                            labelText: 'Password',
                            controller: passwordController,
                            onChanged: _signUpFormCtrl.passwordChanged,
                            onSubmitted: (value) =>
                                passwordController.text = value,
                            hintText: 'Enter your passowrd',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.security,
                            errorText: _signUpFormCtrl.passwordErrorText.value,
                            obscureText: true,
                          );
                        }),
                        SizedBox(
                          height: SPACING + 20,
                        ),
                        CustomButtonWidget(
                            buttonName: 'Sign Up',
                            onPressed: _signUpFormCtrl.submitFunction),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.LOGIN),
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
                              onTap: () => Get.toNamed(Routes.LOGIN),
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
