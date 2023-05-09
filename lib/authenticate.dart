//Names: Batool, Christian, Inaya, Kevine
//Description: authenticate --> This file checks that the user has an account with our app using firebase authentication
// Class: CSI CUE 2023


// Imports the necessary packages for the app to run
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lsat_prep_app_2/signUp.dart';

class MyUser{
  final String uid;
  // constructor of user id stored in firestore
  MyUser({required this.uid});
}

class AuthService {

  signUp signUpScreen = signUp(title: 'Sign Up');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FireBaseUser
  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future registerUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }

    // sign out
  }
}
