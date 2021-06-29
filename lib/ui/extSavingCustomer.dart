import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/ui/widgets/customWidgets.dart';

class ExtSavingCustomerPage extends GetView<SavingController> {
  AuthController _authController = AuthController();
  static const double SPACING = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.extSavingscaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text(
          'Target Saving Exisitng Customer',
          style: Theme.of(context).textTheme.headline1,
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
                key: controller.extSavingformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextfieldWidget(
                        // initialValue: controller.surname.value,
                        labelText: 'Card No',
                        controller: controller.cardNoController,
                        onChanged: controller.cardNoChanged,
                        onSubmitted: (value) =>
                            controller.cardNoController.text = value,
                        hintText: 'Enter customer card number',
                        keyboardType: TextInputType.name,
                        //prefixIcon: Icons.account_balance_rounded,
                        errorText: controller.cardNoErrorText.value,
                        validator: (value) =>
                            controller.validateCardNo(value!)),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    CustomTextfieldWidget(
                        // initialValue: controller.surname.value,
                        labelText: 'Amount',
                        controller: controller.amountController,
                        onChanged: controller.amountChanged,
                        onSubmitted: (value) =>
                            controller.amountController.text = value,
                        hintText: 'Enter amount',
                        keyboardType: TextInputType.name,
                        //prefixIcon: Icons.account_balance_rounded,
                        errorText: controller.amountErrorText.value,
                        validator: (value) =>
                            controller.validateAmount(value!)),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    CustomButtonWidget(
                        buttonName: 'Submit',
                        onPressed: _authController.connectionStatus.value != 0
                            ? null
                            : controller.submitForm),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
