//import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/CategoryRecognition.dart';
import 'package:lsat_prep_app_2/flashCards.dart';
import 'package:lsat_prep_app_2/practiceExam.dart';
import 'package:lsat_prep_app_2/profile_page.dart';
import 'package:lsat_prep_app_2/settings.dart';
import 'package:lsat_prep_app_2/Profile.dart';

// class homePage extends StatelessWidget {
//   const homePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: lsatTheme,
//       home: const homePage(),
//     );
//   }
// }

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homeState();
}

class _homeState extends State<homePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
      body: const homeBody(),
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
              return const homePage();
            }));
          }
          if (index == 1){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const ProfilePage();
            }));
          }
          if (index == 2){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const settings();
            }));
          }
          // setState(() {
          //   currentPage = index;
          // });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

class homeBody extends StatelessWidget {
  const homeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
        child:
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  textStyle: lsatTextStyle),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return const pTestDesign();}),);
              }, child: const Text('Practice Exam'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  textStyle: lsatTextStyle),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return const flashCardDesign();}),);
              }, child: const Text('Flash Cards'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[200],
                  textStyle: lsatTextStyle),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return const cateRecogDesign();}),);
              }, child: const Text('Category Recognition'),
            )
          ],
        ),
    );
  }
}