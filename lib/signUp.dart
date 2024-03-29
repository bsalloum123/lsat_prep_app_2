//Names: Batool, Christian, Inaya, Kevine
//Description: signUp --> creates the sign up page when the user choose to create a
//new account from the signIn page of the app. Here the user fills in fields
//provided and an account is made, stored in Firebase and the user is sent back
//to the sign in page
//Class: CSI CUE 2023


// Imports the necessary packages for the app to run
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lsat_prep_app_2/signIn.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class signUp extends StatefulWidget {
  const signUp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // Sets the opening screen state to the OpeningScreenState class
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";

  // Creates controllers, one for username, password, first name, last name, and email
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // The BuildContext builds what the sign in page will look like
  @override

  // Fields filled in creating a new user is Firebase, only first 5 are filled by user
  createUser()async {
    final User? user = FirebaseAuth.instance.currentUser;
    usersRef.doc(user?.uid).set({
      'username': userNameController.text,
      'password': passwordController.text,
      'first name': firstNameController.text,
      'last name': lastNameController.text,
      'email': emailController.text,
      'id': user?.uid,
      'bio': "",
      'profilePhoto': "",
      'testDateYear': 2023,
      'testDateMonth': 06,
      'testDateDay': 15,
    });
  }

  // Make fill in areas for user to enter Username, password, first & lastname and email
  // Submitting results in going back to signIn page of app
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: Hero(
            tag: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      '...',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    )),

                // Creates container for username
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),

                // Creates container for password
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),

                // Creates container for first name
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),

                // Creates container for last name
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                ),

                // Creates container for email
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),

                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        email = emailController.text;
                        password = passwordController.text;
                        dynamic result = await _auth.registerUser(email.trim(), password);
                        if (result == null){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Error registering")));
                        }
                        else {
                          if (!mounted) return;
                          createUser();
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return const signIn();
                          }));
                        }
                      },
                    )
                ),
              ],
            )));
  }
}