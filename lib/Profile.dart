import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/homePage.dart';
import 'package:lsat_prep_app_2/settings.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
      ), //AppBar
      body: Row(
        //mainAxisAlignment: mainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: crossAxisAlignment.stretch,
          children: [
            //ImageBanner("assets/images/ProfileLSAT.png"),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white, // red is a static member
              ), // Box decoration
              child: const Text('Welcome: User Name'),
            ), // Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue, // red is a static member
              ), // Box decoration
              child: const Text("You have completed this number of questions"),
            ), // Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.green, // red is a static member
              ), // Box decoration
              child: const Text('All Sections'),
            ), // Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white, // red is a static member
              ), // Box decoration
              child: const Text('Info'),
            ), // Container
          ]
      ),
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
              return const homeDesign();
            }));
          }
          if (index == 1){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const Profile();
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
      ),//Row
    ); //Scaffold
  }
}


