import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:andelinks/models/models.dart';
import 'package:andelinks/utils/uuid.dart';

class BorrowingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createSurvery(SurveyModel data) async {
    try {
      await _firestore.collection("surveys").doc().set({
        "id": Uuid().generateV4(),
        "uid": data.uid,
        "cardNo": data.cardNo,
        "amount": data.amount,
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
        "collectionPoint": data.collectionPoint,
        "paymentPlan": data.paymentPlan,
        "salesAgent": data.salesAgent,
        "responserLocation": data.responserLocation,
        "longitude": data.longitude,
        "latitude": data.latitude,
        "customerImageUrl": data.customerImageUrl,
        "customerIDImageName": data.customerIDImageName,
        "customerIDImageUrl": data.customerIDImageUrl,
        "customerImageName": data.customerImageName,
        "createdAt": Timestamp.now()
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
