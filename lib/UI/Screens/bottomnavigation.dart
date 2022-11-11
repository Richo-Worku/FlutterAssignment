import 'package:flutter/material.dart';
import 'package:new_project/UI/Screens/Location.dart';

import 'Character.dart';
import 'episode.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  selector(index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Location();

      case 2:
        return Episode();
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: selector(currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFFF9A826),
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Characters'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Location'),
            BottomNavigationBarItem(
                icon: Icon(Icons.pattern), label: 'Episodes'),
          ],
        ));
  }
}
