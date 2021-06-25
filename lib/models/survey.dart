import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyModel {
  String? id;
  late String uid;
  late String surname;
  String? otherNames;
  String? customerTypeLabel;
  String? customerTypeID;
  late String customerType;
  String? bvn;
  String? otherNumber;
  String? dateOfBirth;
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
  String? customerImageUrl;
  String? customerImageName;
  String? customerIDImageUrl;
  String? customerIDImageName;
  Timestamp? createdAt;

  SurveyModel(
      {this.id,
      required this.uid,
      required this.surname,
      this.otherNames,
      this.customerTypeLabel,
      this.customerTypeID,
      required this.customerType,
      this.bvn,
      this.otherNumber,
      this.dateOfBirth,
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
      this.responserLocation,
      this.customerImageUrl,
      this.customerIDImageName,
      this.customerIDImageUrl,
      this.customerImageName,
      this.createdAt});

  SurveyModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot['uid'];
    id = documentSnapshot.id;
    surname = documentSnapshot['surname'];
    otherNames = documentSnapshot['otherNames'];
    customerType = documentSnapshot['customerType'];
    gender = documentSnapshot['gender'];
    address = documentSnapshot['address'];
    alternativeSurname = documentSnapshot['alternativeSurname'];
    alternativeOtherName = documentSnapshot['alternativeOtherName'];
    alternativeContactRelationship =
        documentSnapshot['alternativeContactRelationship'];
    paymentPlan = documentSnapshot['paymentPlan'];
    responserLocation = documentSnapshot['responserLocation'];
    createdAt = documentSnapshot['createdAt'];

    if (documentSnapshot['customerType'] == 'Borrowing') {
      customerTypeLabel = documentSnapshot['customerTypeLabel'];
      customerTypeID = documentSnapshot['customerTypeID'];
      bvn = documentSnapshot['bvn'];
      otherNumber = documentSnapshot['otherNumber'];
      dateOfBirth = documentSnapshot['dateOfBirth'];
      maritalStatus = documentSnapshot['maritalStatus'];
      alternativePhone = documentSnapshot['alternativePhone'];
      alternativeSecondPhone = documentSnapshot['alternativeSecondPhone'];
      phoneType = documentSnapshot['phoneType'];
      deviceSerial = documentSnapshot['deviceSerial'];
      serviceCenter = documentSnapshot['serviceCenter'];
      sellingDSR = documentSnapshot['sellingDSR'];
      dsrName = documentSnapshot['dsrName'];
      customerImageUrl = documentSnapshot['customerImageUrl'];
      customerIDImageName = documentSnapshot['customerIDImageName'];
      customerIDImageUrl = documentSnapshot['customerIDImageUrl'];
      customerImageName = documentSnapshot['customerImageName'];
    }
  }
}
