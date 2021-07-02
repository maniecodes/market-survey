import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyDetailService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//  getSurverysByID(String id) async {
//     try {
//       // return _firestore
//       //     .collection("surveys")
//       //     .where('id', isEqualTo: id)
//       //     .snapshots()
//       //     .map((QuerySnapshot query) {
//       //   SurveyModel newModel;
//       //   query.docs.forEach((doc) {
//       //   newModel =   SurveyModel.fromDocumentSnapshot(documentSnapshot: doc);
//       //   });
//       //   return newModel;
//       // });
//       return await _firestore
//           .collection("surveys")
//           .get()
//           .then((DocumentSnapshot documentSnapshot) => print('DOc'));
//     } catch (e) {
//       print(e.toString());
//     }
//   }
}
