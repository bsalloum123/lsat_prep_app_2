import 'package:flutter/material.dart';
import './answer.dart';
import './context.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
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
                    questions[questionIndex]['contextText'].toString(),
                  ),
                  Question(
                    questions[questionIndex]['questionText'].toString(),
                  ),
                  ...(questions[questionIndex]['answers']
                          as List<Map<String, Object>>)
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
