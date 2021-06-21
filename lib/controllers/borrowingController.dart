import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/borrowing.dart';
import 'package:survey/service/services.dart';

class BorrowingController extends GetxController {
  AuthController _auth = AuthController();
  BorrowingService _borrowingService = BorrowingService();
  RxBool isCustomerType = false.obs;
  final customerType = 'Borrowing';

  RxString customerTypeHintText = ''.obs;
  RxString selectedCustomerIDImagePath = ''.obs;
  RxString selectedCustomerIDImageSize = ''.obs;
  RxString selectedCustomerPhotoImagePath = ''.obs;
  RxString selectedCustomerPhotoImageSize = ''.obs;

  RxString surname = ''.obs;
  RxString otherNames = ''.obs;
  RxString customerTypeLabel = ''.obs;
  RxString customerTypeID = ''.obs;
  RxString bvn = ''.obs;
  RxString otherNumber = ''.obs;
  RxString dateOfBirth = ''.obs;
  RxString gender = ''.obs;
  RxString maritalStatus = ''.obs;
  RxString address = ''.obs;
  RxString alternativeSurname = ''.obs;
  RxString alternativeOtherName = ''.obs;
  RxString alternativePhone = ''.obs;
  RxString alternativeSecondPhone = ''.obs;
  RxString alternativeContactRelationship = ''.obs;
  RxString phoneType = ''.obs;
  RxString serviceCenter = ''.obs;
  RxString paymentPlan = ''.obs;
  RxString deviceSerial = ''.obs;
  RxString sellingDSR = ''.obs;
  RxString dsrName = ''.obs;
  RxString responserLocation = ''.obs;

  RxnString surnameErrorText = RxnString(null);
  RxnString otherNamesErrorText = RxnString(null);
  RxnString customerTypeErrorText = RxnString(null);
  RxnString customerTypeIDErrorText = RxnString(null);
  RxnString bvnErrorText = RxnString(null);
  RxnString otherNumberErrorText = RxnString(null);
  RxnString addressErrorText = RxnString(null);
  RxnString alternativeSurnameErrorText = RxnString(null);
  RxnString alternativeOtherNameErrorText = RxnString(null);
  RxnString alternativePhoneErrorText = RxnString(null);
  RxnString alternativeSecondPhoneErrorText = RxnString(null);
  RxnString phoneTypeErrorText = RxnString(null);
  RxnString serviceCenterErrorText = RxnString(null);
  RxnString paymentPlanErrorText = RxnString(null);
  RxnString deviceSerialErrorText = RxnString(null);
  RxnString sellingDSRErrorText = RxnString(null);
  RxnString dsrNameErrorText = RxnString(null);
  RxnString responserLocationErrorText = RxnString(null);
  Rxn<Function> submitFunc = Rxn<Function>(null);

  RxBool surnameValidation = false.obs;

  @override
  void onInit() async {
    super.onInit();
    debounce(surname, surnameValidations, time: Duration(microseconds: 400));
  }

  void addressValidations(String val) async {
    addressErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      submitFunc.value = submitFunc;
      addressErrorText.value = null;
      return;
    }
    addressErrorText.value = "Customer address is required";
  }

  void customerTypeValidations(String val) async {
    customerTypeErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      submitFunc.value = submitFunc;
      customerTypeErrorText.value = null;
      return;
    }
    customerTypeErrorText.value = "Customer type is required";
  }

  void otherNamesValidations(String val) async {
    otherNamesErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      submitFunc.value = submitFunc;
      otherNamesErrorText.value = null;
      return;
    }
    otherNamesErrorText.value = "Input other names";
  }

  void surnameValidations(String val) async {
    print(val);
    surnameErrorText.value = null;
    submitFunc.value = null;
    if (val.isNotEmpty) {
      submitFunc.value = submitFunc;
      surnameErrorText.value = null;
      surnameValidation.value = true;
      return;
    }
    surnameErrorText.value = "Surname is required";
  }

  void getCustomerPhotoImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedCustomerPhotoImagePath.value = pickedFile.path;
      selectedCustomerPhotoImageSize.value =
          ((File(selectedCustomerPhotoImagePath.value)).lengthSync() /
                      1024 /
                      1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void getCustomerIDImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedCustomerIDImagePath.value = pickedFile.path;
      selectedCustomerIDImageSize.value =
          ((File(selectedCustomerIDImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void surnameChanged(String val) => surname.value = val;
  void otherNamesChanged(String val) => otherNames.value = val;
  void customerTypeChanged(bool val) => isCustomerType.value = val;
  void customerTypeIDChanged(String val) => customerTypeID.value = val;
  void bvnChanged(String val) => bvn.value = val;
  void otherNumberChanged(String val) => otherNumber.value = val;
  void dateOfBirthChanged(String val) => dateOfBirth.value = val;
  void genderChanged(String val) => gender.value = val;
  void maritalStatusChanged(String val) => maritalStatus.value = val;
  void addressChanged(String val) => address.value = val;
  void alternativeSurnameChanged(String val) => alternativeSurname.value = val;
  void alternativeOtherNameChanged(String val) =>
      alternativeOtherName.value = val;
  void alternativePhoneChanged(String val) => alternativePhone.value = val;
  void alternativeSecondPhoneChanged(String val) =>
      alternativeSecondPhone.value = val;
  void alternativeContactRelationshipChanged(String val) =>
      alternativeContactRelationship.value = val;
  void phoneTypeChanged(String val) => phoneType.value = val;
  void serviceCenterChanged(String val) => serviceCenter.value = val;
  void paymentPlanChanged(String val) => paymentPlan.value = val;
  void deviceSerialChanged(String val) => deviceSerial.value = val;
  void sellingDSRChanged(String val) => sellingDSR.value = val;
  void dsrNameChanged(String val) => dsrName.value = val;
  void responserLocationChanged(String val) => responserLocation.value = val;

  void customerTypeLabelChanged(String val) => customerTypeLabel.value = val;
  void customerTypeHintTextChanged(String val) =>
      customerTypeHintText.value = val;

  submitFunction() async {
    if (surnameValidation.value) {
      EasyLoading.show(status: 'loading...');

      try {
        BorrowingModel data = BorrowingModel(
            uid: _auth.getUser.uid,
            surname: surname.value,
            otherNames: otherNames.value,
            customerTypeLabel: customerTypeLabel.value,
            customerTypeID: customerTypeID.value,
            customerType: customerType,
            bvn: bvn.value,
            otherNumber: otherNumber.value,
            dateOfBirth: dateOfBirth.value,
            gender: gender.value,
            maritalStatus: maritalStatus.value,
            address: address.value,
            alternativeSurname: alternativeSurname.value,
            alternativeOtherName: alternativeOtherName.value,
            alternativePhone: alternativePhone.value,
            alternativeSecondPhone: alternativeSecondPhone.value,
            alternativeContactRelationship:
                alternativeContactRelationship.value,
            phoneType: phoneType.value,
            deviceSerial: deviceSerial.value,
            serviceCenter: serviceCenter.value,
            paymentPlan: paymentPlan.value,
            sellingDSR: sellingDSR.value,
            dsrName: dsrName.value,
            responserLocation: responserLocation.value);
        if (await _borrowingService.createSurvery(data)) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Entry submitted!');
          update();
        }
        EasyLoading.dismiss();
      } catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("Could not save", error.toString(),
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 7),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } else {
      EasyLoading.showError('Fill in required fields');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
