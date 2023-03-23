//import 'package:getwidget/getwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/practiceExam.dart';
import 'package:lsat_prep_app_2/settings.dart';
import 'package:lsat_prep_app_2/Profile.dart';

final colorMid = HexColor.fromHex('#FFC300');
final colorDark = HexColor.fromHex('#DFAB00');
final colorLight = HexColor.fromHex('#FFD240');

const lsatTextStyle = TextStyle(
  fontSize: 22,
  fontStyle: FontStyle.normal,
  color: Colors.black87,
);

var lsatTheme = ThemeData(
  brightness: Brightness.light, // light or dark mode
  primarySwatch: Colors.orange,
  primaryColor: colorMid,
  scaffoldBackgroundColor: HexColor.fromHex('#FFF8DF'),


  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: Colors.purple,
  //   brightness: Brightness.light
  // )

);

class homeDesign extends StatelessWidget {
  const homeDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lsatTheme,
      home: const homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homeState();
}

class _homeState extends State<homePage> {
  int currentPage = 0;
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
              return const homeDesign(); //Temporary black page
            }));
          }
          if (index == 1){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return Profile(); //Temporary black page
            }));
          }
          if (index == 2){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const settings(); //Temporary black page
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
              onPressed: (){}, child: const Text('Flash Cards'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[200],
                  textStyle: lsatTextStyle),
              onPressed: (){}, child: const Text('Category Recognition'),
            )
          ],
        ),
    );
  }
}

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}