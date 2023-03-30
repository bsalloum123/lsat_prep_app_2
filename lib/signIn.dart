//Names: Batool, Christian, Inaya, Kevine
//Description: sign in screen --> creates the sign in page widget: designs the sign in screen

// Imports the necessary packages for the app to run
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/currentUser.dart';
import 'package:lsat_prep_app_2/authenticate.dart';
import 'package:lsat_prep_app_2/homePage.dart';
import 'package:lsat_prep_app_2/signUp.dart';
import 'package:lsat_prep_app_2/TempPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = FirebaseFirestore.instance.collection('users');

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final AuthService _auth = AuthService();
  String email ="";
  String password = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            const SizedBox(height: 40.0),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                      color: Colors.green[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                )),
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

            const SizedBox(height: 20.0),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  email = emailController.text;
                  password = passwordController.text;
                  dynamic result = await _auth.signIn(email, password);
                  if (result==null){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Login Credentials")));
                  }
                  else {
                    createUserInFirestore();
                  }
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have an account?'),
                TextButton(
                  child: const Text(
                    'Register Now',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const signUp(title: 'Sign Up!');
                    }));
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }

  // this creates the user in firestore or pulls their information from firestore
  createUserInFirestore() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await usersRef.doc(user.uid).get();
      if (!doc.exists){
        doc = await usersRef.doc(user.uid).get();
        var currentUser = CurrentUser.fromDocument(doc);
        print(currentUser.username);
      }
      else{
        var currentUser = CurrentUser.fromDocument(doc);
        print(currentUser.username);
        print(currentUser.firstName);
        print(currentUser.lastName);
        print('signed in with email');
        if(!mounted) return;


        Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return const homePage(); //Temporary black page
        }));
      }
      // User is signed in
    } else {
      print("No user");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const signUp(title: 'Sign Up!');
      }));
      // No user is signed in
    }
  }

}