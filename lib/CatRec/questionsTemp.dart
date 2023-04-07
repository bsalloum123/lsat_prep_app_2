import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// FirebaseFirestore db = FirebaseFirestore.instance;
// const questions = questionMap.ourMap;


Future<Map> makeMap() async{
  FirebaseFirestore db = FirebaseFirestore.instance;
  Map<String, dynamic> newMap= {};
  db.collection('catRegLR').orderBy("id_string").limit(3).get().then(
        (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        // print(docSnapshot.data());
        newMap.addAll({
          "contextText": docSnapshot.data()["context"],
          "question": docSnapshot.data()["question"],
          "answers": [
            {'text': 'Identify a Flaw', 'score': -1},
            {'text': 'Strengthen', 'score': -1},
            {'text': 'Implication', 'score': 1},
            {'text': 'Sufficient Assumptions', 'score': -1},
          ],
        });
      }
      print(newMap);
      return newMap;
    },
    onError: (e) => print("Error completing: $e"),
  );
}
// class questionMap{
//   static Map ourMap(Map outMap){
//     var newMap = {};
//     db.collection('catRegLR').orderBy("id_string").limit(3).get().then(
//           (querySnapshot) {
//         print("Successfully completed");
//         for (var docSnapshot in querySnapshot.docs) {
//           // print(docSnapshot.data());
//           newMap.addAll({
//             "contextText": docSnapshot.data()["context"],
//             "question": docSnapshot.data()["question"],
//             "answers": [
//               {'text': 'Identify a Flaw', 'score': -1},
//               {'text': 'Strengthen', 'score': -1},
//               {'text': 'Implication', 'score': 1},
//               {'text': 'Sufficient Assumptions', 'score': -1},
//             ],
//           });
//         }
//         return newMap;
//         print(newMap);
//       },
//       onError: (e) => print("Error completing: $e"),
//     );
//   }
// }

// FirebaseFirestore db = FirebaseFirestore.instance;
// var ourMap = {};
// void questionMap(db, newMap){
//   db.collection('catRegLR').orderBy("id_string").limit(3).get().then(
//         (querySnapshot) {
//       print("Successfully completed");
//       for (var docSnapshot in querySnapshot.docs) {
//         // print(docSnapshot.data());
//         newMap.addAll({
//           "contextText": docSnapshot.data()["context"],
//           "question": docSnapshot.data()["question"],
//           "answers": [
//             {'text': 'Identify a Flaw', 'score': -1},
//             {'text': 'Strengthen', 'score': -1},
//             {'text': 'Implication', 'score': 1},
//             {'text': 'Sufficient Assumptions', 'score': -1},
//           ],
//         });
//       }
//       print(newMap);
//     },
//     onError: (e) => print("Error completing: $e"),
//   );
// }
// get _questions => questionMap(db);

// get questions => questionMap(db, ourMap);