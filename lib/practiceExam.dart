//import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';

class pTestDesign extends StatelessWidget {
  const pTestDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const pTestPage();
  }
}

class pTestPage extends StatefulWidget {
  const pTestPage({Key? key}) : super(key: key);

  @override
  State<pTestPage> createState() => _pTestState();
}

class _pTestState extends State<pTestPage> {
  //int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const pTestBody()
    );
  }
}

class pTestBody extends StatelessWidget {
  const pTestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
      margin: const EdgeInsets.all(15.0), // adding margin
        child:
            Column(
              children:[
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                      child: Text(
                        "Question 1:\n\n  Negotiations between the union and the trucking "
                            "industry will not resume unless one or the other of these "
                            "parties agrees to make concessions. The trucking industry "
                            "will not make any concessions without certain prior "
                            "concessions being made by the union, and the union "
                            "will make concessions only if the government agrees "
                            "to act as mediator.\n\n"
                            " If the statements above are true, which one of the "
                            "following must also be true on the basis of them?\n\n"
                            "a) If the union makes concessions, then the trucking industry will also make concessions.\n\n"
                            "b) Differences between the union and the trucking industry will be successfully "
                            "negotiated if the government agrees to act as mediator.\n\n"
                            "c) Negotiations between the union and the trucking industry will not resume.\n\n"
                            "d) Negotiations between the union and the trucking industry will not resume unless "
                            "the government agrees to act as mediator.\n\n"
                            "scrolling works scrolling works scrolling works scrolling works scrolling works "
                            "scrolling works scrolling works scrolling works scrolling works scrolling works "
                            "scrolling works scrolling works scrolling works scrolling works scrolling works "
                            "scrolling works scrolling works scrolling works scrolling works scrolling works "
                            "scrolling works scrolling works scrolling works scrolling works scrolling works "
                            "scrolling works!",
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                        ),
                      ),
                  ),
                ),]
            ),
      ),
    );
  }
}