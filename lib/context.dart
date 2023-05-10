//Names: Batool, Christian, Inaya, Kevine
//Description: context --> This file is used by categoryRecognition and practice exam
// to build the space to be occupied by the context of the question.
//Class: CSI CUE 2023

import 'package:flutter/material.dart';

// Question text provide by catList list
class Context extends StatelessWidget {
  final String contextText;
  const Context(this.contextText, {Key? key}) : super(key: key);

  // Styling text
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 25),
      child: Text(
        contextText,
        style: const TextStyle(fontSize: 21),
        textAlign: TextAlign.left,
      ), //Text
    ); //Container
  }
}
