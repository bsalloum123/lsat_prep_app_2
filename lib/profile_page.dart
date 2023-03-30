import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/colorSchemes.dart';
import 'package:lsat_prep_app_2/settings.dart';
import 'homePage.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profile',
        theme: lsatTheme,
        home:
        Scaffold(
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
          ),
          body:
          ListView(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            minRadius: 60.0,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                              AssetImage(''),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'email...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'temp1',
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'temp2',
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
        ),
      );

  }
}