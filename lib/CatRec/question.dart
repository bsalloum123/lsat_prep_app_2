//Names: Batool, Christian, Inaya, Kevine
//Description: question --> This file is used by CategoryRecognition to build the
//space to be occupied by the question.
//Class: CSI CUE 2023

import 'package:flutter/material.dart';

// Question text provide by catList list
class Question extends StatelessWidget {
  final String questionText;
  const Question(this.questionText, {Key? key}) : super(key: key);

  // Styling text
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
