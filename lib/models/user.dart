import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;

  UserModel({this.uid, this.firstName, this.lastName, this.phone, this.email});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot.id;
    firstName = documentSnapshot['firstName'];
    lastName = documentSnapshot['lastName'];
    phone = documentSnapshot['phone'];
    email = documentSnapshot['email'];
  }
}
