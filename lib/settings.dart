import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/homePage.dart';
import 'package:lsat_prep_app_2/Profile.dart';
import 'package:lsat_prep_app_2/profile_page.dart';
import 'package:lsat_prep_app_2/signIn.dart';

// final List<String> options = <String>['Account Details', 'Visuals', 'Log Out'];
// final List<int> colorCodes = <int>[600, 500, 100];
class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
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
          // selectedIndex: currentPage,
        ),
      );
  }
}
