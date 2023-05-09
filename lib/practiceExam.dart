//Names: Batool, Christian, Inaya, Kevine
//Description: practiceExam --> This file creates an exam where the users
//knowledge of the logical reasoning section of the LSAT is
//tested. Allows for question navigation, answer selection, score counting,
//resetting exam and submitting exam.
// Class: CSI CUE 2023

import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/main.dart';
import 'PracExam/quiz.dart';
import 'PracExam/result.dart';
import 'countdowntimer.dart';

class pTestDesign extends StatefulWidget {
  const pTestDesign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _pTestState();
  }
}

class _pTestState extends State<pTestDesign> {

  // var for storing current question index and score
  var _questionIndex = 0;
  var _totalScore = 0;
  // The _onItemTapped method controls which page on the app is shown
  void _onItemTapped(int index) {
    setState(() {
      if (_questionIndex != examList[0].length) {
        if (index == 0 && _questionIndex > 0) {
          //print('Going back!');
          _questionIndex = _questionIndex - 1;
        } else if (index == 1) {
          //print('Submit button');
          _questionIndex = examList[0].length;
        } else {
          //print('Going forwards!');
          _questionIndex = _questionIndex + 1;
        }
      } else {
        //print("Already submitted");
      }
    });
  }

  // Resets the quiz
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // Answering question increments index and adds to score, stops at end
  void _answerQuestion(int score) {
    // + 1 no matter right or wrong for right now
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < examList[0].length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration();
    Timer? timer;
    final addseconds = 1;
    String greeting = "${0 + addseconds}";

    timer = Timer.periodic(Duration(minutes: 35, seconds: 0), (timer) {
      setState(() {
        greeting = "${DateTime.now().second}";
      });
      final seconds = duration.inSeconds + addseconds;
      final hours = duration.inHours;
      final minutes = duration.inMinutes;
    duration = Duration(hours: hours, minutes: minutes, seconds: seconds);
    });
    return Scaffold(
      // Arrows for navigation and middle button for submitting exam
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconSize: 40,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Previous',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Submit',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Next',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: _onItemTapped,
        // selectedItemColor: Colors.blue,
      ),
      // Title bar showing page title and help button
      appBar: AppBar(
        title: const Text('Practice Exam'),
        actions: <Widget>[

          /*Text(
           "hello",
           // '${duration.inHours}'+ ':' +'${duration.inMinutes}'+ ':' +'${duration.inSeconds}',
            style: const TextStyle(fontSize: 20),
          ),

           */

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
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15.0), // adding margin
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  // As long as their are more questions, the context, question,
                  // and answer boxes are created otherwise it goes to results page
                  child: _questionIndex < examList[0].length
                      ? Quiz(
                    answerQuestion: _answerQuestion, // Changes state
                    questionIndex: _questionIndex, // Index
                    questions: examList,
                  )
                      : Result(_totalScore, _resetQuiz, examList[0].length,
                      (examList[0].length - _totalScore)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
