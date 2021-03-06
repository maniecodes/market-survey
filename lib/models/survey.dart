import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyModel {
  String? id;
  late String uid;
  late String cardNo;
  String? surname;
  String? otherNames;
  String? customerTypeLabel;
  String? customerTypeID;
  String? customerType;
  String? bvn;
  String? otherNumber;
  String? dateOfBirth;
  String? gender;
  String? maritalStatus;
  String? address;
  String? alternativeSurname;
  String? alternativeOtherName;
  String? alternativePhone;
  String? alternativeSecondPhone;
  String? alternativeContactRelationship;
  String? collectionPoint;
  String? paymentPlan;
  String? salesAgent;
  String? responserLocation;
  late double longitude;
  late double latitude;
  double? amount;
  String? customerImageUrl;
  String? customerImageName;
  String? customerIDImageUrl;
  String? customerIDImageName;
  Timestamp? createdAt;

  SurveyModel(
      {this.id,
      required this.uid,
      this.surname,
      required this.cardNo,
      this.otherNames,
      this.customerTypeLabel,
      this.customerTypeID,
      this.customerType,
      this.bvn,
      this.otherNumber,
      this.dateOfBirth,
      this.gender,
      this.maritalStatus,
      this.address,
      this.alternativeSurname,
      this.alternativeOtherName,
      this.alternativePhone,
      this.alternativeSecondPhone,
      this.alternativeContactRelationship,
      this.collectionPoint,
      this.paymentPlan,
      this.salesAgent,
      this.responserLocation,
      required this.longitude,
      required this.latitude,
      this.amount,
      this.customerImageUrl,
      this.customerIDImageName,
      this.customerIDImageUrl,
      this.customerImageName,
      this.createdAt});

  SurveyModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot['uid'];
    id = documentSnapshot.id;
    cardNo = documentSnapshot['cardNo'];
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
    longitude = documentSnapshot['longitude'];
    latitude = documentSnapshot['latitude'];
    amount = documentSnapshot['amount'];
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
      collectionPoint = documentSnapshot['collectionPoint'];
      paymentPlan = documentSnapshot['paymentPlan'];
      salesAgent = documentSnapshot['salesAgent'];
      customerImageUrl = documentSnapshot['customerImageUrl'];
      customerIDImageName = documentSnapshot['customerIDImageName'];
      customerIDImageUrl = documentSnapshot['customerIDImageUrl'];
      customerImageName = documentSnapshot['customerImageName'];
    }
  }
}
