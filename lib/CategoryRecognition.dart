import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/main.dart';
import 'CatRec/quiz.dart';
import 'CatRec/result.dart';

class cateRecogDesign extends StatefulWidget {
  const cateRecogDesign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _cateRecogState();
  }
}

class _cateRecogState extends State<cateRecogDesign> {


  var _questionIndex = 0;
  var _totalScore = 0;
  // var _length= 3;
  // The _onItemTapped method controls which page on the app is shown
  void _onItemTapped(int index) {
    setState(() {
      if (_questionIndex != 5) {
        if (index == 0 && _questionIndex > 0) {
          print('Going back!');
          _questionIndex = _questionIndex - 1;
        } else if (index == 1) {
          print('Submit button');
          _questionIndex = catRecList[0].length;
        } else {
          print('Going forwards!');
          _questionIndex = _questionIndex + 1;
        }
      } else {
        print("Already submitted");
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // + 1 no matter right or wrong for right now
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < catRecList[0].length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconSize: 40,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Previous',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Submit',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Next',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: _onItemTapped,
        // selectedItemColor: Colors.blue,
      ),
      appBar: AppBar(
        title: const Text('Category Recognition'),
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
        child: Container(
          margin: const EdgeInsets.all(15.0), // adding margin
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _questionIndex < catRecList[0].length
                      ? Quiz(
                          answerQuestion: _answerQuestion, // Changes state
                          questionIndex: _questionIndex, // Index
                          questions: catRecList,
                        )
                      : Result(_totalScore, _resetQuiz, catRecList[0].length,
                          (catRecList[0].length - _totalScore)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
