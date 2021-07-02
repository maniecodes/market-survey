import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/ui/widgets/customWidgets.dart';

class SavingCustomerPage extends GetView<SavingController> {
  AuthController _authController = AuthController();
  static const double SPACING = 10.0;

  @override
  Widget build(BuildContext context) {
    List genders = ["Male", "Female"];
    List contactRelationships = [
      "Father",
      "Mother",
      "Son",
      "Daughter",
      "Wife",
      "Husband",
      "Cousin",
      "Nephew",
      "Sister",
      "Brother",
      "Niece"
    ];

    List paymentTypes = ["Daily", "Weekly", "Monthly"];

    controller.isCustomerType.value = false;

    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text(
          'Target Saving Customer',
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
                key: controller.formKey,
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
                        labelText: 'Customer Surname',
                        controller: controller.surnameController,
                        onChanged: controller.surnameChanged,
                        onSubmitted: (value) =>
                            controller.surnameController.text = value,
                        hintText: 'Enter your customer surname',
                        keyboardType: TextInputType.name,
                        //prefixIcon: Icons.account_balance_rounded,
                        errorText: controller.surnameErrorText.value,
                        validator: (value) =>
                            controller.validateSurname(value!)),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    CustomTextfieldWidget(
                        labelText: 'Customer Other Name(s)',
                        controller: controller.otherNamesController,
                        onChanged: controller.otherNamesChanged,
                        onSubmitted: (value) =>
                            controller.otherNamesController.text = value,
                        hintText: 'Enter your customer other names',
                        keyboardType: TextInputType.name,
                        //prefixIcon: Icons.account_balance_rounded,
                        errorText: controller.otherNamesErrorText.value,
                        validator: (value) =>
                            controller.validateotherNames(value!)),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    Text('Gender'),
                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hint: Text('Select Gender'),
                      items: List.generate(genders.length, (index) {
                        return DropdownMenuItem(
                          value: genders[index],
                          child: Text(genders[index].toString(),
                              style: Theme.of(context).textTheme.headline5),
                        );
                      }),
                      onChanged: (value) {
                        controller.gender.value = value.toString();
                      },
                      validator: (value) {
                        return value == null
                            ? controller.validateGender('')
                            : controller.validateGender(value.toString());
                      },
                    ),

                    SizedBox(
                      height: SPACING + 10,
                    ),

                    // TODO:: get address from google but editable
                    CustomTextfieldWidget(
                      labelText: 'Customer Physical Address',
                      controller: controller.addressController,
                      onChanged: controller.addressChanged,
                      onSubmitted: (value) =>
                          controller.addressController.text = value,
                      hintText: 'Enter customer physical address',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.addressErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),

                    CustomTextfieldWidget(
                      labelText: "Alternative Contact Surname",
                      controller: controller.alternativeSurnameController,
                      onChanged: controller.alternativeSurnameChanged,
                      onSubmitted: (value) =>
                          controller.alternativeSurnameController.text = value,
                      hintText: 'Enter alternative contact surname',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.alternativeSurnameErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    CustomTextfieldWidget(
                      labelText: "Alternative Contact Other Name(s)",
                      controller: controller.alternativeOtherNameController,
                      onChanged: controller.alternativeOtherNameChanged,
                      onSubmitted: (value) => controller
                          .alternativeOtherNameController.text = value,
                      hintText: 'Enter alternative contact other names',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.alternativeOtherNameErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),

                    Text('Alternative Contact Relationship'),
                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hint: Text('Select alternative contact relationship'),
                      items:
                          List.generate(contactRelationships.length, (index) {
                        return DropdownMenuItem(
                          value: contactRelationships[index],
                          child: Text(contactRelationships[index].toString(),
                              style: Theme.of(context).textTheme.headline5),
                        );
                      }),
                      onChanged: (value) {
                        controller.alternativeContactRelationship.value =
                            value.toString();
                      },
                    ),

                    SizedBox(
                      height: SPACING + 10,
                    ),

                    Text('Payment Frequency'),

                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hint: Text('Select Payment Plan'),
                      items: List.generate(paymentTypes.length, (index) {
                        return DropdownMenuItem(
                          value: paymentTypes[index],
                          child: Text(paymentTypes[index].toString(),
                              style: Theme.of(context).textTheme.headline5),
                        );
                      }),
                      onChanged: (value) {
                        controller.paymentPlan.value = value.toString();
                      },
                    ),

                    SizedBox(
                      height: SPACING + 10,
                    ),

                    CustomTextfieldWidget(
                      labelText: "Responder Location",
                      controller: controller.responderLocationController,
                      onChanged: controller.responserLocationChanged,
                      onSubmitted: (value) =>
                          controller.responderLocationController.text = value,
                      hintText: '',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.responserLocationErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),

                    CustomButtonWidget(
                        buttonName: 'Submit',
                        onPressed: _authController.connectionStatus.value != 0
                            ? null
                            : controller.checkFormValidation),
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
