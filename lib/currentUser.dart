//Names: Batool, Christian, Inaya, Kevine
//Description: current user --> creates a current user object to track who is currently logged in
// Class: CSI CUE 2023

// Imports the necessary packages for the app to run
import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUser{
  // Contains all fields present in Firestore database
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  late final String profilePhoto;
  late final String bio;
  late final int testDateYear;
  late final int testDateMonth;
  late final int testDateDay;



  // current user constructor
  CurrentUser({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.profilePhoto,
    required this.bio,
    required this.testDateYear,
    required this.testDateMonth,
    required this.testDateDay,
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
      profilePhoto: doc['profilePhoto'],
      testDateYear: doc['testDateYear'],
      testDateMonth: doc['testDateMonth'],
      testDateDay: doc['testDateDay'],
    );
  }

}