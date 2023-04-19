import 'package:cloud_firestore/cloud_firestore.dart';

Future makeList() async {
  // <List<List<String>>>
  try{
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<String> categories = ["Conclusion/Main Point", "Dispute", "Evaluation", "Explain or Resolve", "Identify a Flaw", "Implication", "Match Flaws", "Match Structures", "Most Strongly Supported", "Necessary Assumptions", "Others", "Principle", "Role", "Strengthen", "Sufficient Assumptions", "Technique", "Weaken"];
    List<String> questionList = [];
    List<String> contextList = [];
    List<String> correctAnswerList = [];
    List<List> catList = [];

    catList.add(questionList);
    catList.add(contextList);
    catList.add(correctAnswerList);

    catList.length = 3;
    print(catList);

    return await db.collection('catRegLR').orderBy("id_string").limit(3).get().then(
          (querySnapshot) {
        print("Successfully connected");
        for (var docSnapshot in querySnapshot.docs) {
          catList[0].add(docSnapshot.data()["context"]);
          catList[1].add(docSnapshot.data()["question"]);
          catList[2].add(docSnapshot.data()["question_category"]);

        }
        print("Printing parts of list: ");
        // print(catList[0]);
        // print(catList[1]);
        print(catList[2]);
        return catList;
      },
      // onError: (e) => print("Error completing: $e"),
    );
  } catch (e) {
    print("An error occured when reading response : $e");
    return null;
  }
}
