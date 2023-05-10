//Names: Batool, Christian, Inaya, Kevine
//Description: examList --> This file creates a list of list containing 10 context,
//questions, and 4 possible answers from the dataset in Firestore database. To be
//used by practiceExam page.
// Class: CSI CUE 2023

import 'package:cloud_firestore/cloud_firestore.dart';

Future makeExamList() async {
  // <List<List<String>>>
  // Put in try-catch to avoid errors from fetching from Firebase
  try{
    FirebaseFirestore db = FirebaseFirestore.instance;
    // Lists for questions, context and 4 answers
    List<String> questionList = [];
    List<String> contextList = [];
    List<String> answer1List = [];
    List<String> answer2List = [];
    List<String> answer3List = [];
    List<String> answer4List = [];
    List<List> examList = [];

    // Added into a core list
    examList.add(questionList);
    examList.add(contextList);
    examList.add(answer1List);
    examList.add(answer2List);
    examList.add(answer3List);
    examList.add(answer4List);

    // catList.length = 3;
    //print(examList);

    // Retrieve 10 snapshots from the dateset in Firestore and fill appropriate sub-lists
    return await db.collection('catRegLR').orderBy("id_string").limit(10).get().then(
          (querySnapshot) {
        print("Successfully connected");
        for (var docSnapshot in querySnapshot.docs) {
          examList[0].add(docSnapshot.data()["context"]);
          examList[1].add(docSnapshot.data()["question"] + " (" + docSnapshot.data()["question_category"] + ")"); // Added on category
          examList[2].add(docSnapshot.data()["answers/0"]);
          examList[3].add(docSnapshot.data()["answers/1"]);
          examList[4].add(docSnapshot.data()["answers/2"]);
          examList[5].add(docSnapshot.data()["answers/3"]);

        }
        // print("Printing parts of list: ");
        // print(catList[2]);
        return examList;
      },
      // onError: (e) => print("Error completing: $e"),
    );
  } catch (e) {
    print("An error occured when reading response : $e");
    return null;
  }
}
