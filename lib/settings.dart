import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/homePage.dart';

final List<String> options = <String>['Account Details', 'Visuals', 'Log Out'];
final List<int> colorCodes = <int>[600, 500, 100];

void main() {
  runApp(const settings());
}

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // or dark mode
        // primarySwatch: Colors.amber,
        // primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: const SettingMain(),
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
            // if (index == 2){
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (context) {
            //     return const settings(); //Temporary black page
            //   }));
            // }
            // setState(() {
            //   currentPage = index;
            // });
          },
          //selectedIndex: currentPage,
        ),

      ),
    );
  }
}

class SettingMain extends StatefulWidget {
  const SettingMain({super.key});

  @override
  State<SettingMain> createState() => _SettingMainHomeState();
}

class _SettingMainHomeState extends State<SettingMain> {

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: const Text('Account Details'),
                tileColor: Colors.blueGrey[100],
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
                title: const Text('Accessibility'),
                tileColor: Colors.blueGrey[100],
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
                title: const Text('Log Out'),
                tileColor: Colors.blueGrey[100],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Log Out')),
                      );
                    }),
                  );
                },
              ),
            ]
        ).toList()
    );
  }
}

