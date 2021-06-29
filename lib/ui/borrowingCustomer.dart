import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:survey/controllers/borrowingController.dart';
import 'package:survey/ui/widgets/customWidgets.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BorrowingCustomerPage extends GetView<BorrowingController> {
  static const double SPACING = 10.0;
  final String customerTypeLabel = '';
  final String customerTypeHintText = '';

  @override
  Widget build(BuildContext context) {
    // BorrowingController controller = Get.find<BorrowingController>();
    // surnameController.clear();

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.black,
      primary: Colors.black87,
      minimumSize: Size(40, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
    List<Map<String, dynamic>> values = [
      {
        'data': '1',
        'name': 'National ID',
        'label': 'National ID Number',
        'hint': 'Enter National ID Number'
      },
      {
        'data': '2',
        'name': 'Driver license',
        'label': 'Driver license ID Number',
        'hint': 'Enter Driver license ID Number'
      },
      {
        'data': '3',
        'name': 'Voters Card',
        'label': 'Voters Card Number',
        'hint': 'Enter Voters Card Number'
      },
    ];

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
    List maritalStatus = [
      "Never married",
      "Married",
      "Widowed",
      "Divorced",
      "Seperated"
    ];

    List paymentTypes = ["Daily", "Weekly", "Monthly"];

    // List<Animal> _animals = [
    //   Animal(id: 1, name: "Lion"),
    //   Animal(id: 2, name: "Flamingo"),
    //   Animal(id: 3, name: "Hippo"),
    // ];
    // List<Object?> _selectedAnimals2 = [];
    // List<Animal> _selectedAnimals3 = [];
    // final _items = _animals
    //     .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
    //     .toList();

    controller.isCustomerType.value = false;
    controller.selectedCustomerIDImagePath.value = '';
    controller.selectedCustomerPhotoImagePath.value = '';

    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Credit Sale Customer'),
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
                    // Drop down button
                    Text('Customer ID Type'),
                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hint: Text(
                        'Select customer ID type',
                      ),
                      items: List.generate(values.length, (index) {
                        return DropdownMenuItem(
                          value: values[index],
                          child: Text(values[index]['name'],
                              style: Theme.of(context).textTheme.headline5),
                        );
                      }),
                      onChanged: (Map<String, dynamic>? value) {
                        controller.isCustomerType.value = true;
                        controller.customerTypeLabel.value = value!['label'];
                        controller.customerTypeHintText.value = value['hint'];
                      },
                      validator: (value) {
                        return value == null
                            ? controller.validatecustomerTypeLabel('')
                            : controller
                                .validatecustomerTypeLabel(value.toString());
                      },
                    ),

                    Obx(() {
                      return controller.isCustomerType.value
                          ? Column(
                              children: [
                                SizedBox(
                                  height: SPACING + 10,
                                ),
                                CustomTextfieldWidget(
                                    labelText:
                                        controller.customerTypeLabel.value,
                                    controller:
                                        controller.customerTypeController,
                                    onChanged: controller.customerTypeIDChanged,
                                    onSubmitted: (value) => controller
                                        .customerTypeController.text = value,
                                    hintText:
                                        'Enter ${controller.customerTypeLabel.value}',
                                    keyboardType: TextInputType.name,
                                    //prefixIcon: Icons.account_balance_rounded,
                                    errorText: controller
                                        .customerTypeIDErrorText.value,
                                    validator: (value) => controller
                                        .validatecustomerTypeID(value!)),
                                SizedBox(
                                  height: SPACING + 10,
                                )
                              ],
                            )
                          : SizedBox(
                              height: SPACING + 10,
                            );
                    }),

                    CustomTextfieldWidget(
                      labelText: 'BVN',
                      controller: controller.bvnController,
                      onChanged: controller.bvnChanged,
                      onSubmitted: (value) =>
                          controller.bvnController.text = value,
                      hintText: 'Enter BVN',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.bvnErrorText.value,

                      validator: (value) => controller.validateBVN(value!),
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    CustomTextfieldWidget(
                      labelText: 'Customers Phone Number - (Optional)',
                      controller: controller.otherNumberController,
                      onChanged: controller.otherNumberChanged,
                      onSubmitted: (value) =>
                          controller.otherNumberController.text = value,
                      hintText: 'Enter customer phone number',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.otherNumberErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    DateTimePicker(
                        autovalidate: true,
                        style: Theme.of(context).textTheme.headline5,
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        controller: controller.dateOfBirthController,
                        //initialValue: _initialValue,
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2100),
                        //  icon: Icon(Icons.event),
                        dateLabelText: 'Date of Birth',
                        timeLabelText: "Hour",
                        //use24HourFormat: false,
                        //locale: Locale('pt', 'BR'),
                        // selectableDayPredicate: (date) {
                        //   if (date.weekday == 6 || date.weekday == 7) {
                        //     return false;
                        //   }
                        //   return true;
                        // },
                        onChanged: controller.dateOfBirthChanged,
                        validator: (value) =>
                            controller.validateDateOfBirth(value!),
                        onSaved: (value) => null),

                    SizedBox(
                      height: SPACING + 10,
                    ),
                    // Drop down

                    Text('Gender'),
                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context).textTheme.headline5,
                      hint: Text('Select Gender'),
                      items: List.generate(genders.length, (index) {
                        return DropdownMenuItem(
                          value: genders[index],
                          child: Text(genders[index].toString()),
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
                    Text('Marital Status'),
                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context).textTheme.headline5,
                      hint: Text('Select Marital Status'),
                      items: List.generate(maritalStatus.length, (index) {
                        return DropdownMenuItem(
                          value: maritalStatus[index],
                          child: Text(maritalStatus[index].toString()),
                        );
                      }),
                      onChanged: (value) {
                        controller.maritalStatus.value = value.toString();
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

                    Text("Customer's ID Photo"),
                    Obx(() => controller.selectedCustomerIDImagePath.value == ''
                        ? Text('Slect image from camera or gallery')
                        : Image.file(
                            File(controller.selectedCustomerIDImagePath.value),
                            width: 200,
                            height: 200,
                          )),
                    Row(
                      children: [
                        TextButton(
                            style: flatButtonStyle,
                            onPressed: () {
                              controller.getCustomerIDImage(ImageSource.camera);
                            },
                            child: Text(
                              'Camera',
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            style: flatButtonStyle,
                            onPressed: () {
                              controller
                                  .getCustomerIDImage(ImageSource.gallery);
                            },
                            child: Text(
                              'Gallery',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),

                    //     Container(
                    //   height: 100,
                    //   width: 200,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: borrowingCustomer.image == null
                    //           ? AssetImage(pathAsset)
                    //           : FileImage(borrowingCustomer.image),
                    //       fit: BoxFit.cover,
                    //     ),
                    //     border: Border.all(
                    //       width: 3.0,
                    //       color: Colors.grey,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(
                    //             5.0) //         <--- border radius here
                    //         ),
                    //   ),
                    // ))),
                    Text("Customer's photo"),
                    Obx(() =>
                        controller.selectedCustomerPhotoImagePath.value == ''
                            ? Text('Slect image from camera or gallery')
                            : Image.file(
                                File(controller
                                    .selectedCustomerPhotoImagePath.value),
                                width: 200,
                                height: 200,
                              )),
                    Row(
                      children: [
                        TextButton(
                            style: flatButtonStyle,
                            onPressed: () {
                              controller
                                  .getCustomerPhotoImage(ImageSource.camera);
                            },
                            child: Text(
                              'Camera',
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            style: flatButtonStyle,
                            onPressed: () {
                              controller
                                  .getCustomerPhotoImage(ImageSource.gallery);
                            },
                            child: Text(
                              'Gallery',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
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
                    CustomTextfieldWidget(
                      labelText: "Alternative Contact Phone Number",
                      controller: controller.alternativePhoneController,
                      onChanged: controller.alternativePhoneChanged,
                      onSubmitted: (value) =>
                          controller.alternativePhoneController.text = value,
                      hintText: 'Enter alertnative contact phone number',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.alternativePhoneErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    CustomTextfieldWidget(
                      labelText: "Alternative Contact Second Phone Number",
                      controller: controller.alternativeSecondPhoneController,
                      onChanged: controller.alternativeSecondPhoneChanged,
                      onSubmitted: (value) => controller
                          .alternativeSecondPhoneController.text = value,
                      hintText: 'Enter alertnative contact second phone number',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText:
                          controller.alternativeSecondPhoneErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    Text('Alternative Contact Relationship'),
                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context).textTheme.headline5,
                      hint: Text('Select alternative contact relationship'),
                      items:
                          List.generate(contactRelationships.length, (index) {
                        return DropdownMenuItem(
                          value: contactRelationships[index],
                          child: Text(contactRelationships[index].toString()),
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
                    // CustomTextfieldWidget(
                    //   labelText: "Type of phone",
                    //   controller: controller.phoneTypeController,
                    //   onChanged: controller.phoneTypeChanged,
                    //   onSubmitted: (value) =>
                    //       controller.phoneTypeController.text = value,
                    //   hintText: 'Enter type of phone model',
                    //   keyboardType: TextInputType.name,
                    //   //prefixIcon: Icons.account_balance_rounded,
                    //   errorText: controller.phoneTypeErrorText.value,
                    // ),
                    // SizedBox(
                    //   height: SPACING + 10,
                    // ),
                    // CustomTextfieldWidget(
                    //   labelText: "Device Serial Number",
                    //   controller: controller.deviceSerialController,
                    //   onChanged: controller.deviceSerialChanged,
                    //   onSubmitted: (value) =>
                    //       controller.deviceSerialController.text = value,
                    //   hintText: 'Enter device serial number',
                    //   keyboardType: TextInputType.name,
                    //   //prefixIcon: Icons.account_balance_rounded,
                    //   errorText: controller.deviceSerialErrorText.value,
                    // ),
                    // SizedBox(
                    //   height: SPACING + 10,
                    // ),
                    CustomTextfieldWidget(
                      labelText: "Collection Point",
                      controller: controller.collectionPointController,
                      onChanged: controller.collectionPointChanged,
                      onSubmitted: (value) =>
                          controller.collectionPointController.text = value,
                      hintText: 'Enter collection point',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.collectionPointErrorText.value,
                    ),
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    // Text(
                    //     'Have you ever taken a loan before? From what type of organization? (Select all that apply)'),
                    // Padding(
                    
                    SizedBox(
                      height: SPACING + 10,
                    ),
                    Text('Payment Frequency'),

                    DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context).textTheme.headline5,
                      hint: Text('Select Payment Plan'),
                      items: List.generate(paymentTypes.length, (index) {
                        return DropdownMenuItem(
                          value: paymentTypes[index],
                          child: Text(paymentTypes[index].toString()),
                        );
                      }),
                      onChanged: (value) {
                        controller.paymentPlan.value = value.toString();
                      },
                    ),

                    SizedBox(
                      height: SPACING + 10,
                    ),
                    // CustomTextfieldWidget(
                    //   labelText: "Are you the selling DSR",
                    //   controller: controller.sellingDSRController,
                    //   onChanged: controller.sellingDSRChanged,
                    //   onSubmitted: (value) =>
                    //       controller.sellingDSRController.text = value,
                    //   hintText: '',
                    //   keyboardType: TextInputType.name,
                    //   //prefixIcon: Icons.account_balance_rounded,
                    //   errorText: controller.sellingDSRErrorText.value,
                    // ),
                    // SizedBox(
                    //   height: SPACING + 10,
                    // ),
                    CustomTextfieldWidget(
                      labelText: "Sales Agent",
                      controller: controller.salesAgentController,
                      onChanged: controller.salesAgentChanged,
                      onSubmitted: (value) =>
                          controller.salesAgentController.text = value,
                      hintText: '',
                      keyboardType: TextInputType.name,
                      //prefixIcon: Icons.account_balance_rounded,
                      errorText: controller.salesAgentErrorText.value,
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
                        onPressed: controller.checkFormValidation),
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
