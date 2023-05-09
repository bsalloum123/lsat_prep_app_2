//Names: Batool, Christian, Inaya, Kevine
//Description: homePage -> Creates the home page of the app accessed when
//succussfully logged in to app. Contains navigation to both exams and flash card
//as well as settings and profile.
// Class: CSI CUE 2023

//import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/FlashCard.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/CategoryRecognition.dart';
import 'package:lsat_prep_app_2/FlashCard.dart';
import 'package:lsat_prep_app_2/practiceExam.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homeState();
}

class _homeState extends State<homePage> {
  int currentPage = 0;
  @override
  // Fixes inset of page
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: homeBody(),
    );
  }
}

// Makes three button boxes, one for each feature (Practice Exam, Flash Cards and
// Category Recognition), navigates based on selection.
class homeBody extends StatelessWidget {
  const homeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(44.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[200],
                    textStyle: lsatTextStyle,
                    minimumSize: const Size(320, 70),
                    elevation: 30), // adding margin
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const pTestDesign();}),);
                }, child: const Text('Practice Exam'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(44.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    textStyle: lsatTextStyle,
                    minimumSize: const Size(320, 70),
                    elevation: 30),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const FlashCard();}),);
                }, child: const Text('Flash Cards'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(44.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[200],
                    textStyle: lsatTextStyle,
                    minimumSize: const Size(320, 70),
                    elevation: 30), // adding margin
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const cateRecogDesign();}),);
                }, child: const Text('Category Recognition'),
              ),
            )
          ],
        );
  }
}