import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hello')
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
      ), //Row
    ); //Scaffold
  }
}


