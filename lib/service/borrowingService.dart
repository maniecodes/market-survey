import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:survey/models/models.dart';

class BorrowingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createSurvery(BorrowingModel data) async {
    try {
      await _firestore.collection("surveys").doc().set({
        "uid": data.uid,
        "customerType": data.customerType,
        "surname": data.surname,
        "otherNames": data.otherNames,
        "customerTypeLabel": data.customerTypeLabel,
        "customerTypeID": data.customerTypeID,
        "bvn": data.bvn,
        "otherNumber": data.otherNumber,
        "dateOfBirth": data.dateOfBirth,
        "gender": data.gender,
        "maritalStatus": data.maritalStatus,
        "address": data.address,
        "alternativeSurname": data.alternativeSurname,
        "alternativeOtherName": data.alternativeOtherName,
        "alternativePhone": data.alternativePhone,
        "alternativeSecondPhone": data.alternativeSecondPhone,
        "alternativeContactRelationship": data.alternativeContactRelationship,
        "phoneType": data.phoneType,
        "serviceCenter": data.serviceCenter,
        "paymentPlan": data.paymentPlan,
        "deviceSerial": data.deviceSerial,
        "sellingDSR": data.sellingDSR,
        "dsrName": data.dsrName,
        "responserLocation": data.responserLocation,
        "customerImageUrl": data.customerImageUrl,
        "customerIDImageName": data.customerIDImageName,
        "customerIDImageUrl": data.customerIDImageUrl,
        "customerImageName": data.customerImageName,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
