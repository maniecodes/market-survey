import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:survey/models/models.dart';

class DashboardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<SurveyModel>>? getSurverysByUserID(String uid) {
    try {
      return _firestore
          .collection("surveys")
          .where('uid', isEqualTo: uid)
          .snapshots()
          .map((QuerySnapshot query) {
        List<SurveyModel> retVal = [];
        print(query.docs);

        query.docs.forEach((element) {
          retVal
              .add(SurveyModel.fromDocumentSnapshot(documentSnapshot: element));
        });
        return retVal;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}