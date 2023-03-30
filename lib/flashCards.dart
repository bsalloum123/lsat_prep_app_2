import 'package:flutter/material.dart';

class flashCardDesign extends StatelessWidget {
  const flashCardDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const flashCardPage(),
    );
  }
}

class flashCardPage extends StatefulWidget {
  const flashCardPage({Key? key}) : super(key: key);

  @override
  State<flashCardPage> createState() => _flashCardState();
}

class _flashCardState extends State<flashCardPage> {
  //int currentPage = 0;
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
      body: const flashCardBody()
    );
  }
}

class flashCardBody extends StatelessWidget {
  const flashCardBody({Key? key}) : super(key: key);

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
                    "flash card stuff",
                    style: TextStyle(
                      color: Colors.blue.shade900,
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