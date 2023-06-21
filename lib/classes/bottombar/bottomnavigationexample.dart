
import 'package:flutter/material.dart';
import 'package:flutterapi/classes/profile/profilescreen.dart';
import 'package:flutterapi/classes/setting.dart';
import '../homescreen.dart';

class BottomNavigationExample   extends StatefulWidget {

  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;


  final List<Widget> _bottomNavBarItem = [
    //pick image
    HomeScreen(),
    ProfileScreen(),
    Setting(),
  ];

  _changeTab(int index) {
      setState(() {
        _selectedTab = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavBarItem[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Setting")
        ],
      ),
    );
  }
}