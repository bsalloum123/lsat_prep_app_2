//Names: Batool, Christian, Inaya, Kevine
//Description: FlashCard --> File creates flash cards for studying categories from
//questions alone. Cards display question on one side and clicked to flip and
//show category on the otherside. Arrow Navigation available with current card count.
// Class: CSI CUE 2023

import 'package:flip_card/flip_card.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/CardView.dart';
import 'package:lsat_prep_app_2/FlashQuiz.dart';
import 'package:lsat_prep_app_2/main.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FlashCState();
  }
}

class _FlashCState extends State<FlashCard> {
  // List of FlashQuiz objects to contain question,answer set pairs
  // Uses same list as categoryRecognition, generated from Firestore database dataset
  final List<FlashQuiz> _FlashQuizes = [
    FlashQuiz(
        question: catRecList[1][0],
        answer: catRecList[2][0]),
    FlashQuiz(
        question: catRecList[1][1],
        answer: catRecList[2][1]),
    FlashQuiz(
        question: catRecList[1][2],
        answer: catRecList[2][2]),
    FlashQuiz(
        question: catRecList[1][3],
        answer: catRecList[2][3]),
    FlashQuiz(
        question: catRecList[1][4],
        answer: catRecList[2][4]),
    FlashQuiz(
        question: catRecList[1][5],
        answer: catRecList[2][5]),
  ];

  // Index of current card
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title bar showing page title and help button
        appBar: AppBar(
          title: const Text('Flash Cards'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.help_outline),
              tooltip: 'Show help',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a help bar')));
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  // Makes flippable card from the question and answer object
                  // returned from CardView when given question and answer from
                  // _FlashQuizes list.
                  child: FlipCard(
                    front: CardView(text: _FlashQuizes[_currentIndex].question),
                    back: CardView(text: _FlashQuizes[_currentIndex].answer),
                  ),
                )),
            // Arrows for navigation and middle for current card numbering num/max
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              OutlinedButton.icon(
                  onPressed: showPreviousCard,
                  icon: const Icon(Icons.chevron_left_rounded),
                  label: const Text('Previous')),
              Text(_currentIndex.toString() + "/" + (_FlashQuizes.length).toString()),
              OutlinedButton.icon(
                  onPressed: showNextCard,
                  icon: const Icon(Icons.chevron_right_rounded),
                  label: const Text('Next'))
            ])
          ],
        )));
  }

  // Moves current index up, triggering a card, if more questions available
  void showNextCard() {
    setState(() {
      if (_currentIndex + 1 < _FlashQuizes.length) {
        _currentIndex += 1;
      }
    });
  }

  // Moves current index down, triggering a card, if previous questions available
  void showPreviousCard() {
    setState(() {
      if (_currentIndex - 1 > -1) {
        _currentIndex -= 1;
      }
    });
  }
}
