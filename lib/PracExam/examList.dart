import 'package:cloud_firestore/cloud_firestore.dart';

Future makeExamList() async {
  // <List<List<String>>>
  try{
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<String> questionList = [];
    List<String> contextList = [];
    List<String> answer1List = [];
    List<String> answer2List = [];
    List<String> answer3List = [];
    List<String> answer4List = [];
    List<List> examList = [];

    examList.add(questionList);
    examList.add(contextList);
    examList.add(answer1List);
    examList.add(answer2List);
    examList.add(answer3List);
    examList.add(answer4List);

    // catList.length = 3;
    print(examList);

    return await db.collection('catRegLR').orderBy("id_string").limit(10).get().then(
          (querySnapshot) {
        print("Successfully connected");
        for (var docSnapshot in querySnapshot.docs) {
          examList[0].add(docSnapshot.data()["context"]);
          examList[1].add(docSnapshot.data()["question"] + " (" + docSnapshot.data()["question_category"] + ")");
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
