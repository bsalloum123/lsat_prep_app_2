import 'package:flip_card/flip_card.dart';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/CardView.dart';
import 'package:lsat_prep_app_2/FlashQuiz.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context){
  //   return Scaffold(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.teal
  //     ),
  //     home: const FlashC(),
  //   );
  //
  // }

  @override
  State<StatefulWidget> createState() {
    return _FlashCState();
  }
}
// class FlashC extends StatefulWidget{
//   const FlashC({Key? key}) : super (key: key);
//   @override
//   _FlashCState createState() => _FlashCState();
// }

class _FlashCState extends State<FlashCard> {
  final List<FlashQuiz> _FlashQuizes = [
    FlashQuiz(
        question:
            "If the statements above are true, which one of the following must also be true on the basis of them?",
        answer: "Implication"),
    FlashQuiz(
        question:
            "Which one of the following, if true, would most seriously undermine the scientist's hypothesis?",
        answer: "Weaken"),
    FlashQuiz(
        question:
            "Which of the following, if true, would most strongly support the position above?",
        answer: "Strengthen"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: FlipCard(
                    front: CardView(text: _FlashQuizes[_currentIndex].question),
                    back: CardView(text: _FlashQuizes[_currentIndex].answer),
                  ),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              OutlinedButton.icon(
                  onPressed: showPreviousCard,
                  icon: const Icon(Icons.chevron_left_rounded),
                  label: const Text('Previous')),
              OutlinedButton.icon(
                  onPressed: showNextCard,
                  icon: const Icon(Icons.chevron_right_rounded),
                  label: const Text('Next'))
            ])
          ],
        )));
  }

  void showNextCard() {
    setState(() {
      //(_currentIndex  + 1 < _FlashQuizes.length )? _currentIndex + 1:0;
      if (_currentIndex + 1 < _FlashQuizes.length) {
        _currentIndex += 1;
      }
    });
  }

  void showPreviousCard() {
    setState(() {
      //(_currentIndex  - 1 > 0 )? _currentIndex - 1:0;
      if (_currentIndex - 1 > -1) {
        _currentIndex -= 1;
      }
    });
  }
}
