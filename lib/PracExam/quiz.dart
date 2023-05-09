//Names: Batool, Christian, Inaya, Kevine
//Description: quiz --> This file is used by PracticeExam to build the box
//that contains the context, question, and answer options for the exam.
// Class: CSI CUE 2023

import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/main.dart';
import './answer.dart';
import './context.dart';
import './question.dart';
import './randomNumber.dart';

// Takes list of questions and question index from PracticeExam
// makes a empty function
class Quiz extends StatelessWidget {
  final List<List<dynamic>> questions;
  final int questionIndex;
  final Function answerQuestion;

  // Makes an object of the required variables
  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 4.0,
        color: Colors.green[200],
        child: SizedBox(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                // First list item is the context of questions
                Context(
                  examList[0][questionIndex].toString(),
                ),
                // Second list item is the question
                Question(
                  examList[1][questionIndex].toString(),
                ),
                // Third list item is the correct category
                // This is sent to randomNumber which takes the 4 choices
                // and their scores, with the correct answer returning having the right score
                ... (randomNumber(examList[2][questionIndex],examList[3][questionIndex],examList[4][questionIndex],examList[5][questionIndex]))
                    .map((answer) {
                  return Answer(() => answerQuestion(answer['score']),
                      answer['text'].toString());
                  // String, Object type map
                }).toList()
              ],
            ),
          )),
      ),
    );
  }
}