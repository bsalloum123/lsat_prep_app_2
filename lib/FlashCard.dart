import 'package:flip_card/flip_card.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/CardView.dart';
import 'package:lsat_prep_app_2/FlashQuiz.dart';

class FlashCard extends StatefulWidget{
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

class _FlashCState extends State <FlashCard>{
  final List<FlashQuiz>_FlashQuizes = [
    FlashQuiz(question: "Spell today", answer: "today"),
    FlashQuiz(question: "Spell yesterday", answer: "yesterday"),
    FlashQuiz(question: "Spell monday", answer: "monday"),
  ];

  final int _currentIndex = 0;

  @override
  Widget build (BuildContext context){
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
                child: FlipCard(
                  front: CardView(text: _FlashQuizes[_currentIndex].question),
                  back: CardView(text: _FlashQuizes[_currentIndex].answer),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  OutlinedButton.icon(
                      onPressed: showPreviousCard,
                      icon: const Icon(Icons.chevron_left_rounded),
                      label: const Text('Previous')

                  ),
                  OutlinedButton.icon(
                      onPressed: showNextCard,
                      icon: const Icon(Icons.chevron_right_rounded),
                      label: const Text('Next')

                  )
                ]

              )

            ],
          )
        )
      );
  }
  void showNextCard() {
    setState(() {
      (_currentIndex  + 1 < _FlashQuizes.length )? _currentIndex + 1:0;

    });

  }

  void showPreviousCard() {
    setState(() {
      (_currentIndex  + 1 < _FlashQuizes.length )? _currentIndex + 1:0;

    });
  }
}