import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/models/models.dart';
import 'package:andelinks/routes/routes.dart';
import 'package:andelinks/service/services.dart';

class SavingController extends GetxController {
  AuthController _auth = AuthController();
  SavingService _savingService = SavingService();
  final newCustomerType = 'Saving';
  final existingCustomerType = 'ExistingSaving';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> extSavingformKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> extSavingscaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController cardNoController,
      surnameController,
      otherNamesController,
      customerTypeController,
      addressController,
      alternativeSurnameController,
      alternativeOtherNameController,
      // responderLocationController,
      amountController;

  RxBool isCustomerType = false.obs;

  RxString customerTypeHintText = ''.obs;
  RxString cardNo = ''.obs;
  RxString surname = ''.obs;
  RxString otherNames = ''.obs;
  RxString gender = ''.obs;
  RxString address = ''.obs;
  RxString alternativeSurname = ''.obs;
  RxString alternativeOtherName = ''.obs;
  RxString alternativeContactRelationship = ''.obs;
  RxString paymentPlan = ''.obs;
  RxString responserLocation = ''.obs;
  RxString amount = ''.obs;
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;

  RxnString cardNoErrorText = RxnString(null);
  RxnString surnameErrorText = RxnString(null);
  RxnString otherNamesErrorText = RxnString(null);
  RxnString customerTypeErrorText = RxnString(null);
  RxnString addressErrorText = RxnString(null);
  RxnString alternativeSurnameErrorText = RxnString(null);
  RxnString alternativeOtherNameErrorText = RxnString(null);
  RxnString paymentPlanErrorText = RxnString(null);
  // RxnString responserLocationErrorText = RxnString(null);
  RxnString amountErrorText = RxnString(null);

  @override
  void onInit() async {
    super.onInit();
    cardNoController = TextEditingController();
    surnameController = TextEditingController();
    otherNamesController = TextEditingController();
    customerTypeController = TextEditingController();
    addressController = TextEditingController();
    alternativeSurnameController = TextEditingController();
    alternativeOtherNameController = TextEditingController();
    // responderLocationController = TextEditingController();
    amountController = TextEditingController();
    var location = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    print(placemarks[0]);
    // responderLocationController.text = placemarks[0].street!;
    // responserLocation.value = responderLocationController.text;
    longitude.value = location.longitude;
    latitude.value = location.latitude;
    responserLocation.value = placemarks[0].street.toString() +
        ', ' +
        placemarks[0].administrativeArea.toString() +
        ', ' +
        placemarks[0].country.toString();
  }

  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return position;
  }

  String? validateGender(String value) {
    if (value.isEmpty) return "Gender is required";
    return null;
  }

  String? validateSurname(String value) {
    print(value);
    if (value.isEmpty) return "Surname is requried";

    print('here');
    return null;
  }

  String? validateotherNames(String value) {
    if (value.isEmpty) return "Other names are required";
    return null;
  }

  String? validateCardNo(String value) {
    if (value.isEmpty) return "Card No are required";

    if (value.length != 9) return "Wrong card number";
    return null;
  }

  String? validateAmount(String value) {
    if (value.isEmpty) return "Amount is required";
    return null;
  }

  void cardNoChanged(String val) => cardNo.value = val;
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
  // void responserLocationChanged(String val) => responserLocation.value = val;
  void customerTypeHintTextChanged(String val) =>
      customerTypeHintText.value = val;
  void amountChanged(String val) => amount.value = val;

  void submitForm() async {
    try {
      EasyLoading.show(status: 'loading...');
      final isValid = extSavingformKey.currentState!.validate();
      if (!isValid) {
        EasyLoading.showError('Some fields are required');
        return;
      }

      extSavingformKey.currentState!.save();
      SurveyModel data = SurveyModel(
          uid: _auth.getUser.uid,
          cardNo: cardNo.value,
          amount: double.parse(amount.value),
          surname: null,
          otherNames: null,
          customerTypeLabel: null,
          customerTypeID: null,
          customerType: existingCustomerType,
          bvn: null,
          otherNumber: null,
          dateOfBirth: null,
          gender: null,
          maritalStatus: null,
          address: null,
          alternativeSurname: null,
          alternativeOtherName: null,
          alternativePhone: null,
          alternativeSecondPhone: null,
          alternativeContactRelationship: null,
          collectionPoint: null,
          paymentPlan: null,
          salesAgent: null,
          responserLocation: responserLocation.value,
          longitude: longitude.value,
          latitude: latitude.value);
      if (await _savingService.createSurvery(data)) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Entry submitted!');

        Get.offAllNamed(Routes.DASHBOARD);
        update();
      }
      EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.dismiss();
      Get.snackbar("Error!!! Try again", error.toString(),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 7),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

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
          cardNo: cardNo.value,
          amount: null,
          surname: surname.value,
          otherNames: otherNames.value,
          customerType: newCustomerType,
          gender: gender.value,
          address: address.value,
          alternativeSurname: alternativeSurname.value,
          alternativeOtherName: alternativeOtherName.value,
          alternativeContactRelationship: alternativeContactRelationship.value,
          paymentPlan: paymentPlan.value,
          responserLocation: responserLocation.value,
          longitude: longitude.value,
          latitude: latitude.value);
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
    //  responderLocationController.dispose();
    super.onClose();
  }
}
