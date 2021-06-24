import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:survey/controllers/controllers.dart';
import 'package:survey/models/models.dart';
import 'package:survey/routes/routes.dart';
import 'package:survey/service/services.dart';

class SavingController extends GetxController {
  AuthController _auth = AuthController();
  SavingService _savingService = SavingService();
  final customerType = 'Saving';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController surnameController,
      otherNamesController,
      customerTypeController,
      addressController,
      alternativeSurnameController,
      alternativeOtherNameController,
      responderLocationController;

  RxBool isCustomerType = false.obs;

  RxString customerTypeHintText = ''.obs;
  RxString surname = ''.obs;
  RxString otherNames = ''.obs;
  RxString gender = ''.obs;
  RxString address = ''.obs;
  RxString alternativeSurname = ''.obs;
  RxString alternativeOtherName = ''.obs;
  RxString alternativeContactRelationship = ''.obs;
  RxString paymentPlan = ''.obs;
  RxString responserLocation = ''.obs;

  RxnString surnameErrorText = RxnString(null);
  RxnString otherNamesErrorText = RxnString(null);
  RxnString customerTypeErrorText = RxnString(null);
  RxnString addressErrorText = RxnString(null);
  RxnString alternativeSurnameErrorText = RxnString(null);
  RxnString alternativeOtherNameErrorText = RxnString(null);
  RxnString paymentPlanErrorText = RxnString(null);
  RxnString responserLocationErrorText = RxnString(null);

  @override
  void onInit() async {
    super.onInit();
    surnameController = TextEditingController();
    otherNamesController = TextEditingController();
    customerTypeController = TextEditingController();
    addressController = TextEditingController();
    alternativeSurnameController = TextEditingController();
    alternativeOtherNameController = TextEditingController();
    responderLocationController = TextEditingController();
  }

  String? validateGender(String value) {
    if (value.isEmpty) {
      return "Gender is required";
    }
    return null;
  }

  String? validateSurname(String value) {
    print(value);
    if (value.isEmpty) {
      return "Surname is requried";
    }
    print('here');
    return null;
  }

  String? validateotherNames(String value) {
    if (value.isEmpty) {
      return "Other names are required";
    }
    return null;
  }

  void surnameChanged(String val) => surname.value = val;
  void otherNamesChanged(String val) => otherNames.value = val;
  void customerTypeChanged(bool val) => isCustomerType.value = val;
  void genderChanged(String val) => gender.value = val;
  void addressChanged(String val) => address.value = val;
  void alternativeSurnameChanged(String val) => alternativeSurname.value = val;
  void alternativeOtherNameChanged(String val) =>
      alternativeOtherName.value = val;
  void alternativeContactRelationshipChanged(String val) =>
      alternativeContactRelationship.value = val;
  void paymentPlanChanged(String val) => paymentPlan.value = val;
  void responserLocationChanged(String val) => responserLocation.value = val;
  void customerTypeHintTextChanged(String val) =>
      customerTypeHintText.value = val;

  void checkFormValidation() async {
    try {
      EasyLoading.show(status: 'loading...');
      final isValid = formKey.currentState!.validate();

      if (!isValid) {
        EasyLoading.showError('Some fields are required');
        return;
      }
      formKey.currentState!.save();

      SurveyModel data = SurveyModel(
        uid: _auth.getUser.uid,
        surname: surname.value,
        otherNames: otherNames.value,
        customerType: customerType,
        gender: gender.value,
        address: address.value,
        alternativeSurname: alternativeSurname.value,
        alternativeOtherName: alternativeOtherName.value,
        alternativeContactRelationship: alternativeContactRelationship.value,
        paymentPlan: paymentPlan.value,
        responserLocation: responserLocation.value,
      );
      if (await _savingService.createSurvery(data)) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Entry submitted!');

        Get.offAllNamed(Routes.DASHBOARD);
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
  }

  @override
  void onClose() {
    surnameController.dispose();
    otherNamesController.dispose();
    customerTypeController.dispose();
    addressController.dispose();
    alternativeSurnameController.dispose();
    alternativeOtherNameController.dispose();
    responderLocationController.dispose();
    super.onClose();
  }
}
