import 'package:flutter/material.dart';

final List<String> options = <String>['Account Details', 'Visuals', 'Log Out'];
final List<int> colorCodes = <int>[600, 500, 100];

void main() {
  runApp(settings());
}

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData(

//       ),
//       home: SettingMain(),
//     );
//   }
// }


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
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.green,
          child: Center(child: Text(options[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

