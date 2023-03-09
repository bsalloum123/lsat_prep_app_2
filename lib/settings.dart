import 'package:flutter/material.dart';

final List<String> options = <String>['Account Details', 'Visuals', 'Log Out'];
final List<int> colorCodes = <int>[600, 500, 100];

void main() {
  runApp(settings());
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
          body: SettingMain()
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
                title: Text('Account Details'),
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
                title: Text('Accessibility'),
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
                title: Text('Log Out'),
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

