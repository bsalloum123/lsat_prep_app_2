//Names: Batool, Christian, Inaya, Kevine
//Description: Main --> constructs main structure of the app and then sign in page

// Imports the necessary packages for the app to run
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homePage.dart';

// The main function calls for the app to run
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());}

// The MyApp class sets up what the app looks like
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This sets up the app's title when you first open it
  static const String _title = 'LSAT Prep App';
  // The BuildContext builds what the main page will look like
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: lsatTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.help_outline),
              tooltip: 'Show help',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a help bar')));
              },
            ),
          ],
        ),


        body:
        // Calls the OpeningScreen to be the first page the user sees
        const signIn(),
      ),
    );
  }
}
