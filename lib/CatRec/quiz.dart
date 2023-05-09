//Names: Batool, Christian, Inaya, Kevine
//Description: quiz --> This file is used by CategoryRecognition to build the box
//that contains the context, question, and answer options for the exam.
// Class: CSI CUE 2023

import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/main.dart';
import './answer.dart';
import './context.dart';
import './question.dart';
import './randomNumber.dart';

// Takes list of questions and question index from CategoryRecognition
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
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height - 190,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                // First list item is the context of questions
                Context(
                  catRecList[0][questionIndex].toString(),
                ),
                // Second list item is the question
                Question(
                  catRecList[1][questionIndex].toString(),
                ),
                // Third list item is the correct category
                // This is sent to randomNumber which creates the 4 answer choices
                // and their scores, with the correct category having the right score
                ... (randomNumber(catRecList[2][questionIndex]))
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