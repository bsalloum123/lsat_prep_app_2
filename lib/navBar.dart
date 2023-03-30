// The BasicBottomNavBar class creates the variables for the navigation bar
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsat_prep_app_2/homePage.dart';
import 'package:lsat_prep_app_2/profile_page.dart';
import 'package:lsat_prep_app_2/settings.dart';
import 'currentUser.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key, required this.title, required this.currentUser}) : super(key: key, );
  final String title; // The title shown on the app's header
  final CurrentUser currentUser; // The current user's information
  @override

  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

// The _BasicBottomNavBarState creates the widgets for the BasicBottomNavBar
class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0; // This controls which page is shown on the app
  late CurrentUser user = widget.currentUser; // The current user's information

  // This list calls all the other pages
  late final List<Widget> _pages = <Widget>[
    homePage(),
    ProfilePage(currentUser: user),
    settings()
  ];

  // The _onItemTapped method controls which page on the app is shown
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This controls the text shown on the header
        title: const Text('Sign out'),
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
      // This puts whatever page the selectedIndex has on the center of the app screen
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),

      // This creates the bottom navigation bar with icons for each page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}