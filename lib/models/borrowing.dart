import 'package:cloud_firestore/cloud_firestore.dart';

class BorrowingModel {
  late String uid;
  late String surname;
  String? otherNames;
  late String customerTypeLabel;
  late String customerTypeID;
  late String customerType;
  String? bvn;
  String? otherNumber;
  late String dateOfBirth;
  late String gender;
  String? maritalStatus;
  String? address;
  String? alternativeSurname;
  String? alternativeOtherName;
  String? alternativePhone;
  String? alternativeSecondPhone;
  String? alternativeContactRelationship;
  String? phoneType;
  String? serviceCenter;
  String? paymentPlan;
  String? deviceSerial;
  String? sellingDSR;
  String? dsrName;
  String? responserLocation;

  BorrowingModel(
      {required this.uid,
      required this.surname,
      this.otherNames,
      required this.customerTypeLabel,
      required this.customerTypeID,
      required this.customerType,
      this.bvn,
      this.otherNumber,
      required this.dateOfBirth,
      required this.gender,
      this.maritalStatus,
      this.address,
      this.alternativeSurname,
      this.alternativeOtherName,
      this.alternativePhone,
      this.alternativeSecondPhone,
      this.alternativeContactRelationship,
      this.phoneType,
      this.serviceCenter,
      this.paymentPlan,
      this.deviceSerial,
      this.sellingDSR,
      this.dsrName,
      this.responserLocation});

  BorrowingModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot.id;
    surname = documentSnapshot['surname'];
    otherNames = documentSnapshot['otherNames'];
    customerTypeLabel = documentSnapshot['customerTypeLabel'];
    customerTypeID = documentSnapshot['customerTypeID'];
    customerType = documentSnapshot['customerType'];
    bvn = documentSnapshot['bvn'];
    otherNumber = documentSnapshot['otherNumber'];
    dateOfBirth = documentSnapshot['dateOfBirth'];
    gender = documentSnapshot['gender'];
    maritalStatus = documentSnapshot['maritalStatus'];
    address = documentSnapshot['address'];
    alternativeSurname = documentSnapshot['alternativeSurname'];
    alternativeOtherName = documentSnapshot['alternativeOtherName'];
    alternativePhone = documentSnapshot['alternativePhone'];
    alternativeSecondPhone = documentSnapshot['alternativeSecondPhone'];
    alternativeContactRelationship =
        documentSnapshot['alternativeContactRelationship'];
    phoneType = documentSnapshot['phoneType'];
    deviceSerial = documentSnapshot['deviceSerial'];
    serviceCenter = documentSnapshot['serviceCenter'];
    paymentPlan = documentSnapshot['paymentPlan'];
    sellingDSR = documentSnapshot['sellingDSR'];
    dsrName = documentSnapshot['dsrName'];
    responserLocation = documentSnapshot['responserLocation'];
  }
}
