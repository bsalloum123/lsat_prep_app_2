//Names: Batool, Christian, Inaya, Kevine
//Description: RandomNumber --> This generates a map with the answers to scores for each
//question in the categoryRecognition. Returns map.
// Class: CSI CUE 2023

import 'dart:math';

// List of all categories
List<String> categories = ["Conclusion/Main Point", "Dispute", "Evaluation", "Explain or Resolve", "Identify a Flaw", "Implication", "Match Flaws", "Match Structures", "Most Strongly Supported", "Necessary Assumptions", "Others", "Principle", "Role", "Strengthen", "Sufficient Assumptions", "Technique", "Weaken"];

// correctAnswer contains the correct category
List<Map<String, Object>> randomNumber(correctAnswer){
  List<String> n = [];
  //Initial scores set to 0, or wrong
  List<int> i = [0,0,0,0];
  // List<Map<String, Object>> x;

  // Fills list with random categories until has 4
  while(n.length < 4){
    var current = categories[Random().nextInt(4)];
    if(!n.contains(current)) {
      n.add(current);
    }
  }

  // If one of the random categories is correct its value is updated at the index
  // Otherwise one is over written randomly and value update.
  if (n.contains(correctAnswer)){
    i[n.indexOf(correctAnswer)] = 1;
  }
  else{
    var temp = Random().nextInt(4);
    n[temp] = correctAnswer;
    i[temp] = 1;
  }

  var x = [
      {'text': n[0], 'score': i[0]},
      {'text': n[1], 'score': i[1]},
      {'text': n[2], 'score': i[2]},
      {'text': n[3], 'score': i[3]},
  ];
  return x;
}

