import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:survey/models/models.dart';
import 'package:survey/utils/uuid.dart';

class SavingService {
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
        "gender": data.gender,
        "address": data.address,
        "alternativeSurname": data.alternativeSurname,
        "alternativeOtherName": data.alternativeOtherName,
        "alternativeContactRelationship": data.alternativeContactRelationship,
        "paymentPlan": data.paymentPlan,
        "responserLocation": data.responserLocation,
        "createdAt": Timestamp.now()
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
