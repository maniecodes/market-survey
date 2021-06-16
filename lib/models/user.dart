import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;

  UserModel({this.id, this.firstName, this.lastName, this.phone, this.email});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    firstName = documentSnapshot['firstName'];
    lastName = documentSnapshot['lastName'];
    phone = documentSnapshot['phone'];
    email = documentSnapshot['email'];
  }
}
