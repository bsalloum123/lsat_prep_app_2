import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';


List<Map<String, dynamic>> randomNumber(Answer1,Answer2,Answer3,Answer4){
  List<int> i = [0,0,0,0];
  // List<Map<String, Object>> x;


  var temp = Random().nextInt(4);

  i[temp] = 1;
  var x = [
      {'text': Answer1, 'score': i[0]},
      {'text': Answer2, 'score': i[1]},
      {'text': Answer3, 'score': i[2]},
      {'text': Answer4, 'score': i[3]},
  ];
  return x;
}

