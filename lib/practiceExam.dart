import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/homePage.dart';

class pTestDesign extends StatelessWidget {
  const pTestDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: const pTestPage(),
    );
  }
}

class pTestPage extends StatefulWidget {
  const pTestPage({Key? key}) : super(key: key);

  @override
  State<pTestPage> createState() => _pTestState();
}

class _pTestState extends State<pTestPage> {
  int currentPage = 0;
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
      body: pTestBody(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
        onDestinationSelected: (int index){
          if (index == 0){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const homeDesign(); //Temporary black page
            }));
          }
          //setState(() {
          //  currentPage = index;
          //});
        },
        //selectedIndex: currentPage,
      ),
    );
  }
}

class pTestBody extends StatelessWidget {
  const pTestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Center();
  }
}