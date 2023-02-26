//Names: Batool, Christian, Inaya, Kevine
//Description: Temporary Page to navigate to after sign in

import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class temp extends StatefulWidget {
  const temp({Key? key}) : super(key: key);

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Welcome!',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ));
  }
}
