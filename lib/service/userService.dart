import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:andelinks/models/models.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "uid": user.uid,
        "firstName": user.firstName,
        "lastName": user.lastName,
        "phone": user.phone,
        "email": user.email,
        "token": user.token,
        "role": user.role
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    // print('got inside here');
    // print(uid);
    // print('my new uid');
    DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();
    // print('user service');
    // print(_doc.data());
    return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
  }
}
