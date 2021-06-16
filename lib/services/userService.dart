import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:survey/models/models.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "uid": user.id,
        "firstName": user.firstName,
        "lastName": user.lastName,
        "phone": user.phone,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();
    return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
  }
}
