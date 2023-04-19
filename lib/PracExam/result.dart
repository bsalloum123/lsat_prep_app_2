// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  final int questionsLength;
  final int wrongAnswers;


  const Result(this.resultScore, this.resetHandler, this.questionsLength,this.wrongAnswers, {Key? key})
      : super(key: key);

// //Remark Logic
//   String get resultPhrase {
//     String resultText = "Total Questions Answered:";
//     print("$resultScore / $questionsLength");
//     return resultText;
//   }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 100.0,
          ),
          const Text(
            // resultPhrase,
            "Your answers have been submitted!",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Card(
            elevation: 4.0,
            child: SizedBox(
              width: 400,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$resultScore",
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Correct \n Answers",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                      ],
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$questionsLength",
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Total \n Questions",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$wrongAnswers",
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Wrong \n Answers",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  ],
              )
            ),
          ),
          TextButton(
            onPressed: resetHandler,
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
