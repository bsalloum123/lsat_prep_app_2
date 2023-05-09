//Names: Batool, Christian, Inaya, Kevine
//Description: settings --> File creates the setting page, where the user can find
//tabs for account details, accessibility options and logging out. Only logging
// out has been implemented.
// Class: CSI CUE 2023

import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/signIn.dart';

// final List<String> options = <String>['Account Details', 'Visuals', 'Log Out'];
// final List<int> colorCodes = <int>[600, 500, 100];
class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children: <Widget> [
          Card(
            child: ListTile(
              title: const Text('Account Details', style: lsatTextStyle),
              tileColor: Colors.green[300],
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Account Details')),
                    );
                  }),
                );
              },
            )
          ),
          Card(
            child: ListTile(
              title: const Text('Accessibility', style:lsatTextStyle),
              tileColor: Colors.green[300],
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Accessibility')),
                    );
                  }),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Log Out', style:lsatTextStyle),
              tileColor: Colors.green[300],
              trailing: const Icon(Icons.logout ),
              onTap: () {
                Navigator.push(
                  context,
                  // Returns user to the signIn page of the app
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    return signIn();
                    //Scaffold(appBar: AppBar(title: const Text('Log Out')),
                  }),
                );
              },
            ),
          ),
        ]
      )
    );
  }
}
