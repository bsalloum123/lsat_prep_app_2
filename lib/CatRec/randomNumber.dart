import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';

List<String> categories = ["Conclusion/Main Point", "Dispute", "Evaluation", "Explain or Resolve", "Identify a Flaw", "Implication", "Match Flaws", "Match Structures", "Most Strongly Supported", "Necessary Assumptions", "Others", "Principle", "Role", "Strengthen", "Sufficient Assumptions", "Technique", "Weaken"];

List<Map<String, Object>> randomNumber(correctAnswer){
  List<String> n = [];
  List<int> i = [0,0,0,0];
  // List<Map<String, Object>> x;

  while(n.length < 4){
    var current = categories[Random().nextInt(4)];
    if(!n.contains(current)) {
      n.add(current);
    }
  }
  var temp = Random().nextInt(4);

  n[temp] = correctAnswer;
  i[temp] = 1;
  var x = [
      {'text': n[0], 'score': i[0]},
      {'text': n[1], 'score': i[1]},
      {'text': n[2], 'score': i[2]},
      {'text': n[3], 'score': i[3]},
  ];
  return x;
}

