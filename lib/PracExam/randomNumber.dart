//Names: Batool, Christian, Inaya, Kevine
//Description: randomNumber --> This generates a map with the answers to scores for each
//question in the practiceExam. Returns map.
// Class: CSI CUE 2023

import 'dart:math';

// AnswerX contain the string of the answer selection
List<Map<String, dynamic>> randomNumber(Answer1,Answer2,Answer3,Answer4){
  //Initial scores set to 0, or wrong
  List<int> i = [0,0,0,0];
  // List<Map<String, Object>> x;

  // One answer randomly gets to be correct, with appropriate score
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

