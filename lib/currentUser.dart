//Names: Batool, Christian, Inaya, Kevine
//Description: current user --> creates a current user object to track who is currently logged in

// Imports the necessary packages for the app to run
import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUser{
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  late final String bio;
  final String profileImage;

  // current user constructor
  CurrentUser({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.bio,
    required this.profileImage,
  });

  // this method returns the current user information
  factory CurrentUser.fromDocument(DocumentSnapshot doc){
    return CurrentUser(
      id: doc['id'],
      email: doc['email'],
      password: doc['password'],
      firstName: doc['first name'],
      lastName: doc['last name'],
      bio: doc['bio'],
      username: doc['username'],
      profileImage: doc['profileImage'],
    );
  }
  static CurrentUser fromMap(Map<String, dynamic> map) {
    return CurrentUser(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      firstName: map['first name'],
      lastName: map['last name'],
      bio: map['bio'],
      username: map['username'],
      profileImage: map['profileImage'],
    );
  }

}