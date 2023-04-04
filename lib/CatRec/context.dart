import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Context extends StatelessWidget {
  final String contextText;
  const Context(this.contextText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 25),
      child: Text(
        contextText,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.left,
      ), //Text
    ); //Container
  }
}
