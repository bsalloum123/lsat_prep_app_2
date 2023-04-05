import 'package:flutter/material.dart';

//import 'CatRec/answer.dart';
//import 'CatRec/question.dart';
import 'CatRec/quiz.dart';
import 'CatRec/result.dart';

class cateRecogDesign extends StatefulWidget {
  const cateRecogDesign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _cateRecogState();
  }
}

/*class cateRecogPage extends StatefulWidget {
  const cateRecogPage({Key? key}) : super(key: key);

  @override
  State<cateRecogPage> createState() => _cateRecogState();
}*/

class _cateRecogState extends State<cateRecogDesign> {
  final _questions = const [
    {
      'contextText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quam ex, pharetra ac scelerisque vel, suscipit et sapien. Mauris eu enim eget nibh convallis aliquam non eu orci. In metus augue, vestibulum ut quam in, ultricies eleifend nulla. Vestibulum sit.',
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'contextText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quam ex, pharetra ac scelerisque vel, suscipit et sapien. Mauris eu enim eget nibh convallis aliquam non eu orci. In metus augue, vestibulum ut quam in, ultricies eleifend nulla. Vestibulum sit.',
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
          'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'contextText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quam ex, pharetra ac scelerisque vel, suscipit et sapien. Mauris eu enim eget nibh convallis aliquam non eu orci. In metus augue, vestibulum ut quam in, ultricies eleifend nulla. Vestibulum sit.',
      'questionText': 'Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'contextText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quam ex, pharetra ac scelerisque vel, suscipit et sapien. Mauris eu enim eget nibh convallis aliquam non eu orci. In metus augue, vestibulum ut quam in, ultricies eleifend nulla. Vestibulum sit.',
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': -2},
        {'text': 'Jeremy Ashkenas', 'score': -2},
      ],
    },
    {
      'contextText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quam ex, pharetra ac scelerisque vel, suscipit et sapien. Mauris eu enim eget nibh convallis aliquam non eu orci. In metus augue, vestibulum ut quam in, ultricies eleifend nulla. Vestibulum sit.',
      'questionText': 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  // The _onItemTapped method controls which page on the app is shown
  void _onItemTapped(int index) {
    setState(() {
      if (_questionIndex != 5) {
        if (index == 0 && _questionIndex > 0) {
          print('Going back!');
          _questionIndex = _questionIndex - 1;
        } else if (index == 1) {
          print('Submit button');
          _questionIndex = _questions.length;
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
    // Future.delayed(const Duration(seconds: 2), () async {
    //   setState(() {
    //     _questionIndex = 0;
    //     _totalScore = 0;
    //   });
    // });
  }

  void _answerQuestion(int score) {
    // + 1 no matter right or wrong for right now
    _totalScore += 1;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // Future.delayed(const Duration(seconds: 2), () async {
    //   setState(() {
    //     _questionIndex = _questionIndex + 1;
    //   });
    // });

    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
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
        bottomNavigationBar:
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
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
        body:
        Center(
          child: Container(
            margin: const EdgeInsets.all(15.0), // adding margin
            child:
            Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: _questionIndex < _questions.length
                          ? Quiz(
                            answerQuestion: _answerQuestion,
                            questionIndex: _questionIndex,
                            questions: _questions,
                        )
                            : Result(_totalScore, _resetQuiz, _questions.length, (_questions.length - _totalScore)),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
    );
  }
}

/*class cateRecogBody extends StatelessWidget {
  const cateRecogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15.0), // adding margin
        child:
        Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: _questionIndex < _questions.length ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: _questions,
                    ) //Quiz
                        : Result(_totalScore, _resetQuiz),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}*/
