import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/Profile.dart';
import 'package:lsat_prep_app_2/homePage.dart';
import 'package:lsat_prep_app_2/profile_page.dart';
import 'package:lsat_prep_app_2/settings.dart';

class cateRecogDesign extends StatelessWidget {
  const cateRecogDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: const cateRecogPage(),
    );
  }
}

class cateRecogPage extends StatefulWidget {
  const cateRecogPage({Key? key}) : super(key: key);

  @override
  State<cateRecogPage> createState() => _cateRecogState();
}

class _cateRecogState extends State<cateRecogPage> {
  //int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Recognition'),
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
      body: const cateRecogBody(),
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
              return const ProfilePage();
            }));
          }
          if (index == 2){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const settings();
            }));
          }
          //setState(() {
          //  currentPage = index;
          //});
        },
        //selectedIndex: currentPage,
      ),
    );
  }
}

class cateRecogBody extends StatelessWidget {
  const cateRecogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15.0), // adding margin
        child:
        Column(
            children:[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Category Recognition stuff",
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),]
        ),
      ),
    );
  }
}