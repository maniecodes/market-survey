import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:survey/models/models.dart';

class DashboardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<SurveyModel>>? getAllSurvey() {
    print('get all survey');
    try {
      return _firestore
          .collection("surveys")
          .orderBy("createdAt", descending: false)
          .snapshots()
          .map((QuerySnapshot query) {
        List<SurveyModel> retVal = [];
        print(query.docs);

        query.docs.forEach((element) async {
          var data =
              SurveyModel.fromDocumentSnapshot(documentSnapshot: element);
          // print(data.uid);
          //  DocumentSnapshot _doc = await _firestore.collection("users").doc(data.uid).get();

          retVal.add(data);
          print(retVal);
        });

        return retVal;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<List<SurveyModel>>? getSurverysByUserID(String uid) {
    print('inside here');
    print(uid);
    try {
      return _firestore
          .collection("surveys")
          .where('uid', isEqualTo: uid)
          .orderBy("createdAt", descending: false)
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
