//Names: Batool, Christian, Inaya, Kevine
//Description: answer --> This file creates each answer box for practiceExam
//Class: CSI CUE 2023

import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';

// String contains the text of the answer and the select handler for callback return
class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          onPressed: selectHandler,
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white)),
              backgroundColor: MaterialStateProperty.all(Colors.orange[200])),
          child: Text(answerText),
        ),
      ),
    );
  }
}
