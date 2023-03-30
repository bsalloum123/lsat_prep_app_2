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
            children:ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    title: const Text('Account Details', style: lsatTextStyle),
                    tileColor: colorLight,
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
                  ),
                  ListTile(
                    title: const Text('Accessibility', style:lsatTextStyle),
                    tileColor: colorLight,
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
                  ListTile(
                    title: const Text('Log Out', style:lsatTextStyle),
                    tileColor: colorLight,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(builder: (BuildContext context) {
                          return signIn();
                            //Scaffold(appBar: AppBar(title: const Text('Log Out')),
                        }),
                      );
                    },
                  ),
                ]
            ).toList()
        )
      );
  }
}
