import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:survey/controllers/borrowingController.dart';
import 'package:survey/ui/widgets/customWidgets.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BorrowingCustomerPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController otherNamesController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();
  final TextEditingController bvnController = TextEditingController();
  final TextEditingController otherNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController alternativeSurnameController =
      TextEditingController();
  final TextEditingController alternativeOtherNameController =
      TextEditingController();
  final TextEditingController alternativePhoneController =
      TextEditingController();
  final TextEditingController alternativeSecondPhoneController =
      TextEditingController();
  final TextEditingController phoneTypeController = TextEditingController();
  final TextEditingController deviceSerialController = TextEditingController();
  final TextEditingController serviceCenterController = TextEditingController();
  final TextEditingController sellingDSRController = TextEditingController();
  final TextEditingController dsrNameController = TextEditingController();
  final TextEditingController responderLocationController =
      TextEditingController();

  static const double SPACING = 10.0;
  String customerTypeLabel = '';
  String customerTypeHintText = '';

  @override
  Widget build(BuildContext context) {
    BorrowingController _borrowingCtrl = Get.find<BorrowingController>();
    surnameController.clear();
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

    _borrowingCtrl.isCustomerType.value = false;
    _borrowingCtrl.selectedCustomerIDImagePath.value = '';
    _borrowingCtrl.selectedCustomerPhotoImagePath.value = '';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Borrowing Customer'),
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
                            initialValue: _borrowingCtrl.surname.value,
                            labelText: 'Customer Surname',
                            controller: surnameController,
                            onChanged: _borrowingCtrl.surnameChanged,
                            onSubmitted: (value) =>
                                surnameController.text = value,
                            hintText: 'Enter your customer surname',
                            keyboardType: TextInputType.name,
                            //prefixIcon: Icons.account_balance_rounded,
                            errorText: _borrowingCtrl.surnameErrorText.value,
                            obscureText: false,
                          );
                        }),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: 'Customer Other Name(s)',
                          controller: otherNamesController,
                          onChanged: _borrowingCtrl.otherNamesChanged,
                          onSubmitted: (value) =>
                              otherNamesController.text = value,
                          hintText: 'Enter your customer other names',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.otherNamesErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        // Drop down button
                        Text('Customer ID Type'),
                        DropdownButtonFormField(
                          hint: Text('Select customer ID type'),
                          items: List.generate(values.length, (index) {
                            return DropdownMenuItem(
                              value: values[index],
                              child: Text(values[index]['name']),
                            );
                          }),
                          onChanged: (Map<String, dynamic>? value) {
                            // print(value!['label']);
                            _borrowingCtrl.isCustomerType.value = true;

                            _borrowingCtrl.customerTypeLabel.value =
                                value!['label'];
                            _borrowingCtrl.customerTypeHintText.value =
                                value['hint'];
                            // show the next input field
                            // if national ID is selected validate the field
                            //
                          },
                        ),

                        Obx(() {
                          return _borrowingCtrl.isCustomerType.value
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: SPACING + 10,
                                    ),
                                    CustomTextfieldWidget(
                                      labelText: _borrowingCtrl
                                          .customerTypeLabel.value,
                                      controller: customerTypeController,
                                      onChanged:
                                          _borrowingCtrl.customerTypeIDChanged,
                                      onSubmitted: (value) =>
                                          customerTypeController.text = value,
                                      hintText:
                                          'Enter ${_borrowingCtrl.customerTypeLabel.value}',
                                      keyboardType: TextInputType.name,
                                      //prefixIcon: Icons.account_balance_rounded,
                                      errorText: _borrowingCtrl
                                          .customerTypeIDErrorText.value,
                                      obscureText: false,
                                    ),
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
                          labelText: 'BVN (Optional)',
                          controller: bvnController,
                          onChanged: _borrowingCtrl.bvnChanged,
                          onSubmitted: (value) => bvnController.text = value,
                          hintText: 'Enter BVN',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.bvnErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: 'Customers Other Number - (Optional)',
                          controller: otherNumberController,
                          onChanged: _borrowingCtrl.otherNumberChanged,
                          onSubmitted: (value) =>
                              otherNumberController.text = value,
                          hintText: 'Enter customer other number',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.otherNumberErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        DateTimePicker(
                            type: DateTimePickerType.date,
                            dateMask: 'd MMM, yyyy',
                            controller: dateOfBirthController,
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

                            onChanged: _borrowingCtrl.dateOfBirthChanged,
                            validator: null,
                            onSaved: (val) => null),

                        SizedBox(
                          height: SPACING + 10,
                        ),
                        // Drop down

                        Text('Gender'),
                        DropdownButtonFormField(
                          hint: Text('Select Gender'),
                          items: List.generate(genders.length, (index) {
                            return DropdownMenuItem(
                              value: genders[index],
                              child: Text(genders[index].toString()),
                            );
                          }),
                          onChanged: (value) {
                            _borrowingCtrl.gender.value = value.toString();
                          },
                        ),

                        SizedBox(
                          height: SPACING + 10,
                        ),
                        Text('Marital Status'),
                        DropdownButtonFormField(
                          hint: Text('Select Marital Status'),
                          items: List.generate(maritalStatus.length, (index) {
                            return DropdownMenuItem(
                              value: maritalStatus[index],
                              child: Text(maritalStatus[index].toString()),
                            );
                          }),
                          onChanged: (value) {
                            _borrowingCtrl.maritalStatus.value =
                                value.toString();
                          },
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        // TODO:: get address from google but editable
                        CustomTextfieldWidget(
                          labelText: 'Customer Physical Address',
                          controller: addressController,
                          onChanged: _borrowingCtrl.addressChanged,
                          onSubmitted: (value) =>
                              addressController.text = value,
                          hintText: 'Enter customer physical address',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.addressErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),

                        Text("Customer's ID Photo"),
                        Obx(() =>
                            _borrowingCtrl.selectedCustomerIDImagePath.value ==
                                    ''
                                ? Text('Slect image from camera or gallery')
                                : Image.file(
                                    File(_borrowingCtrl
                                        .selectedCustomerIDImagePath.value),
                                    width: 200,
                                    height: 200,
                                  )),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  _borrowingCtrl
                                      .getCustomerIDImage(ImageSource.camera);
                                },
                                child: Text('Camera')),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () {
                                  _borrowingCtrl
                                      .getCustomerIDImage(ImageSource.gallery);
                                },
                                child: Text('Gallery')),
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
                        Obx(() => _borrowingCtrl
                                    .selectedCustomerPhotoImagePath.value ==
                                ''
                            ? Text('Slect image from camera or gallery')
                            : Image.file(
                                File(_borrowingCtrl
                                    .selectedCustomerPhotoImagePath.value),
                                width: 200,
                                height: 200,
                              )),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  _borrowingCtrl.getCustomerPhotoImage(
                                      ImageSource.camera);
                                },
                                child: Text('Camera')),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () {
                                  _borrowingCtrl.getCustomerPhotoImage(
                                      ImageSource.gallery);
                                },
                                child: Text('Gallery')),
                          ],
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),

                        CustomTextfieldWidget(
                          labelText: "Alternative Contact Surname",
                          controller: alternativeSurnameController,
                          onChanged: _borrowingCtrl.alternativeSurnameChanged,
                          onSubmitted: (value) =>
                              alternativeSurnameController.text = value,
                          hintText: 'Enter alternative contact surname',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText:
                              _borrowingCtrl.alternativeSurnameErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Alternative Contact Other Name(s)",
                          controller: alternativeOtherNameController,
                          onChanged: _borrowingCtrl.alternativeOtherNameChanged,
                          onSubmitted: (value) =>
                              alternativeOtherNameController.text = value,
                          hintText: 'Enter alternative contact other names',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl
                              .alternativeOtherNameErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Alternative Contact Phone Number",
                          controller: alternativePhoneController,
                          onChanged: _borrowingCtrl.alternativePhoneChanged,
                          onSubmitted: (value) =>
                              alternativePhoneController.text = value,
                          hintText: 'Enter alertnative contact phone number',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText:
                              _borrowingCtrl.alternativePhoneErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Alternative Contact Second Phone Number",
                          controller: alternativeSecondPhoneController,
                          onChanged:
                              _borrowingCtrl.alternativeSecondPhoneChanged,
                          onSubmitted: (value) =>
                              alternativeSecondPhoneController.text = value,
                          hintText:
                              'Enter alertnative contact second phone number',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl
                              .alternativeSecondPhoneErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        Text('Alternative Contact Relationship'),
                        DropdownButtonFormField(
                          hint: Text('Select alternative contact relationship'),
                          items: List.generate(contactRelationships.length,
                              (index) {
                            return DropdownMenuItem(
                              value: contactRelationships[index],
                              child:
                                  Text(contactRelationships[index].toString()),
                            );
                          }),
                          onChanged: (value) {
                            _borrowingCtrl.alternativeContactRelationship
                                .value = value.toString();
                          },
                        ),

                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Type of phone",
                          controller: phoneTypeController,
                          onChanged: _borrowingCtrl.phoneTypeChanged,
                          onSubmitted: (value) =>
                              phoneTypeController.text = value,
                          hintText: 'Enter type of phone model',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.phoneTypeErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Device Serial Number",
                          controller: deviceSerialController,
                          onChanged: _borrowingCtrl.deviceSerialChanged,
                          onSubmitted: (value) =>
                              deviceSerialController.text = value,
                          hintText: 'Enter device serial number',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.deviceSerialErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Service Center",
                          controller: serviceCenterController,
                          onChanged: _borrowingCtrl.serviceCenterChanged,
                          onSubmitted: (value) =>
                              serviceCenterController.text = value,
                          hintText: 'Enter service center',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText:
                              _borrowingCtrl.serviceCenterErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        // Text(
                        //     'Have you ever taken a loan before? From what type of organization? (Select all that apply)'),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 8),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context)
                        //           .primaryColor
                        //           .withOpacity(.4),
                        //       border: Border.all(
                        //         color: Theme.of(context).primaryColor,
                        //         width: 2,
                        //       ),
                        //     ),
                        //     child: Column(
                        //       children: <Widget>[
                        //         MultiSelectBottomSheetField(
                        //           initialChildSize: 0.4,
                        //           listType: MultiSelectListType.CHIP,
                        //           searchable: true,
                        //           buttonText: Text("List of loans"),
                        //           title: Text("List of loans"),
                        //           items: _items,
                        //           onConfirm: (values) {
                        //             _selectedAnimals2 = values;
                        //           },
                        //           chipDisplay: MultiSelectChipDisplay(
                        //             onTap: (value) {
                        //               // setState(() {
                        //               //   _selectedAnimals2.remove(value);
                        //               // });
                        //             },
                        //           ),
                        //         ),
                        //         _selectedAnimals2.isEmpty
                        //             ? Container(
                        //                 padding: EdgeInsets.all(10),
                        //                 alignment: Alignment.centerLeft,
                        //                 child: Text(
                        //                   "None selected",
                        //                   style:
                        //                       TextStyle(color: Colors.black54),
                        //                 ))
                        //             : Container(),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText:
                        //       "For what purpose do you plan to use your device? (Select all that apply)",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText:
                        //       'For what purpose do you plan to use your device? ',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText: "What is your primary source of income?",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText: 'Enter primary source of income',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText:
                        //       "How much did you spend on phone airtime and data in the last seven days",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText:
                        //       'Enter how much you spend on airtime and data',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText:
                        //       "How many people financially depend on you for their livelihood?",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText: '',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText:
                        //       "Which of the following items do you currently have at home? (Select all that apply)",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText: '',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText: "Are you purchasing for personal use?",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText: '',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        // SizedBox(
                        //   height: SPACING + 10,
                        // ),
                        // CustomTextfieldWidget(
                        //   labelText: "What plan do you want to subscribe to?",
                        //   controller: firstNameController,
                        //   onChanged: null,
                        //   onSubmitted: (value) =>
                        //       firstNameController.text = value,
                        //   hintText:
                        //       'Enter how much you spend on airtime and data',
                        //   keyboardType: TextInputType.name,
                        //   //prefixIcon: Icons.account_balance_rounded,
                        //   errorText: null,
                        //   obscureText: false,
                        // ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        Text('Payment Frequency'),

                        DropdownButtonFormField(
                          hint: Text('Select Payment Plan'),
                          items: List.generate(paymentTypes.length, (index) {
                            return DropdownMenuItem(
                              value: paymentTypes[index],
                              child: Text(paymentTypes[index].toString()),
                            );
                          }),
                          onChanged: (value) {
                            _borrowingCtrl.paymentPlan.value = value.toString();
                          },
                        ),

                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Are you the selling DSR",
                          controller: sellingDSRController,
                          onChanged: _borrowingCtrl.sellingDSRChanged,
                          onSubmitted: (value) =>
                              sellingDSRController.text = value,
                          hintText: '',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.sellingDSRErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Name of the DSR",
                          controller: dsrNameController,
                          onChanged: _borrowingCtrl.dsrNameChanged,
                          onSubmitted: (value) =>
                              dsrNameController.text = value,
                          hintText: '',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText: _borrowingCtrl.dsrNameErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),
                        CustomTextfieldWidget(
                          labelText: "Responder Location",
                          controller: responderLocationController,
                          onChanged: _borrowingCtrl.responserLocationChanged,
                          onSubmitted: (value) =>
                              responderLocationController.text = value,
                          hintText: '',
                          keyboardType: TextInputType.name,
                          //prefixIcon: Icons.account_balance_rounded,
                          errorText:
                              _borrowingCtrl.responserLocationErrorText.value,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SPACING + 10,
                        ),

                        CustomButtonWidget(
                            buttonName: 'Submit',
                            onPressed: _borrowingCtrl.submitFunction),
                        SizedBox(
                          height: 20,
                        ),
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
