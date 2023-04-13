import 'package:flutter/material.dart';
//import 'CatRec/answer.dart';
//import 'CatRec/question.dart';
import 'CatRec/quiz.dart';
import 'CatRec/result.dart';

class pTestDesign extends StatefulWidget {
  const pTestDesign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _pTestState();
  }
}

class _pTestState extends State<pTestDesign> {
  final _questions = const [
    {
      'contextText':
      'Negotiations between the union and the trucking industry will not resume unless one or the other of these parties agrees to make concessions. The trucking industry will not make any concessions without certain prior concessions being made by the union, and the union will make concessions only if the government agrees to act as mediator.',
      'questionText': '1. If the statements above are true, which one of the following must also be true on the basis of them?',
      'answers': [
        {'text': 'If the union makes concessions, then the trucking industry will also make concessions.', 'score': -2},
        {'text': 'Strengthen', 'score': -2},
        {'text': 'Implication', 'score': 10},
        {'text': 'Sufficient Assumptions', 'score': -2},
      ],
    },
    {
      'contextText':
      'Scientists analyzing air bubbles that had been trapped in Antarctic ice during the Earth\'s last ice age found that the ice-age atmosphere had contained unusually large amounts of ferrous material and surprisingly small amounts of carbon dioxide. One scientist noted that algae absorb carbon dioxide from the atmosphere. The scientist hypothesized that the ferrous material, which was contained in atmospheric dust, had promoted a great increase in the population of Antarctic algae such as diatoms.',
      'questionText': '2. Which one of the following, if true, would most seriously undermine the scientist\'s hypothesis?',
      'answers': [
        {'text': 'Others', 'score': -2},
        {'text': 'Principle', 'score': -2},
        {'text': 'Implication', 'score': -2},
        {'text': 'Weaken', 'score': 10
        },
      ],
    },
    {
      'contextText':
      'Many breakfast cereals are fortified with vitamin supplements. Some of these cereals provide 100 percent of the recommended daily requirement of vitamins. Nevertheless, a well-balanced breakfast, including a variety of foods, is a better source of those vitamins than are such fortified breakfast cereals alone.',
      'questionText': '3. Which of the following, if true, would most strongly support the position above?',
      'answers': [
        {'text': 'Sufficient Assumptions', 'score': -2},
        {'text': 'Strengthen', 'score': 10},
        {'text': 'Others', 'score': -2},
        {'text': 'Identify a Flaw', 'score': -2},
      ],
    },
    {
      'contextText':
      'The average length of stay for patients at Edgewater Hospital is four days, compared to six days at University Hospital. Since studies show that recovery rates at the two hospitals are similar for patients with similar illnesses, University Hospital could decrease its average length of stay without affecting quality of care.',
      'questionText': '4. The reasoning in the argument is most vulnerable to criticism on the grounds that the argument',
      'answers': [
        {'text': 'Identify a Flaw', 'score': 10},
        {'text': 'Necessary Assumptions', 'score': -2},
        {'text': 'Most Strongly Supported', 'score': -2},
        {'text': 'Explain or Resolve', 'score': -2},
      ],
    },
    {
      'contextText':
      'Everyone should have access to more than one newspaper, for there are at least two sides to every story. Since all sides of an important story should be covered, and no newspaper adequately covers all sides of every one of its stories, some important stories would not be adequately covered if there were only one newspaper.',
      'questionText': '5. Which one of the following most accurately describes a flaw in the reasoning of the argument?',
      'answers': [
        {'text': 'Explain or Resolve', 'score': -2},
        {'text': 'Sufficient Assumptions', 'score': -2},
        {'text': 'Identify a Flaw', 'score': 10},
        {'text': 'Weaken', 'score': -2},
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
        title: const Text('Practice Exam'),
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
                  child: _questionIndex < _questions.length
                      ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                      : Result(_totalScore, _resetQuiz, _questions.length,
                      (_questions.length - _totalScore)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}