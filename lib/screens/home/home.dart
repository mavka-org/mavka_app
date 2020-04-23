import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/pages/pages_controller.dart';
import 'package:mavka/services/auth.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pages = 0;

  @override
  Widget build(BuildContext context) {
    print("I am at home");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(
            milliseconds: 200
          ),
          index: 0,
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.video_library, size: 30),
            Icon(Icons.bookmark, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _pages = index;
            });
          },
        ),
        body: PagesController(_pages),
      ),
    );
  }
}
