import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_project/Location.dart';

import 'Character.dart';
import 'episode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
