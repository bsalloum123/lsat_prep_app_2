import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/main.dart';
import './answer.dart';
import './context.dart';
import './question.dart';
import './randomNumber.dart';

class Quiz extends StatelessWidget {
  final List<List<dynamic>> questions;
  final int questionIndex;
  final Function answerQuestion;

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
                Context(
                  examList[0][questionIndex].toString(),
                  // questions[questionIndex]['contextText'].toString(),
                ),
                Question(
                  examList[1][questionIndex].toString(),
                  // questions[questionIndex]['questionText'].toString(),
                ),
                ... (randomNumber(examList[2][questionIndex],examList[3][questionIndex],examList[4][questionIndex],examList[5][questionIndex]))
                    .map((answer) {
                  return Answer(() => answerQuestion(answer['score']),
                      answer['text'].toString());
                  // const Text('data');
                }).toList()
              ],
            ),
          )),
      ),
    );
  }
}