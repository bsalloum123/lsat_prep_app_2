//Names: Batool, Christian, Inaya, Kevine
//Description: answer --> This file creates each answerbox for the
//category recognition and the practice exam sections
// Class: CSI CUE 2023

import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';

// String contains the text of the answer and the select handler for callback return
class Answer extends StatelessWidget {
  final VoidCallback selectHandler; // for registering the selected answer choice
  final String answerText; // the text of the answer choices based on the practice section

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // width of the box is the width of the screen
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
