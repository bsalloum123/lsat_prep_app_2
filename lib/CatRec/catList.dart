//Names: Batool, Christian, Inaya, Kevine
//Description: catList --> This file creates a list of list containing 10 context,
//10 questions, and 10 correct category from the dataset in Firestore database. To be
//used by categoryRecognition and FlashCard page.
// Class: CSI CUE 2023

import 'package:cloud_firestore/cloud_firestore.dart';

Future makeList() async {
  // <List<List<String>>>
  // Put in try-catch to avoid errors from fetching from Firebase
  try{
    FirebaseFirestore db = FirebaseFirestore.instance;
    // Lists for questions, context and correct category answer
    List<String> questionList = [];
    List<String> contextList = [];
    List<String> correctAnswerList = [];
    List<List> catList = [];

    // Added into a core list
    catList.add(questionList);
    catList.add(contextList);
    catList.add(correctAnswerList);

    // catList.length = 3;
    //print(catList);

    // Retrieve 10 snapshots from the dateset in Firestore and fill appropriate sub-lists
    return await db.collection('catRegLR').orderBy("id_string").limit(10).get().then(
          (querySnapshot) {
        print("Successfully connected");
        for (var docSnapshot in querySnapshot.docs) {
          catList[0].add(docSnapshot.data()["context"]);
          catList[1].add(docSnapshot.data()["question"]);
          catList[2].add(docSnapshot.data()["question_category"]);

        }
        // print("Printing parts of list: ");
        // print(catList[2]);
        return catList;
      },
      // onError: (e) => print("Error completing: $e"),
    );
  } catch (e) {
    print("An error occured when reading response : $e");
    return null;
  }
}
