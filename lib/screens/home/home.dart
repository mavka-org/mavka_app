import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/home_pages/pages_controller.dart';
import 'package:mavka/services/auth.dart';
import 'package:mavka/shared/hex_color.dart';

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
        bottomNavigationBar: SizedBox(
          height: 80.0,
          child: BottomNavigationBar(
            selectedItemColor: HexColor('2684FE'),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons_home.png'),
                title: Text('')
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons_lessons.png'),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons_check.png'),
                title: Text('')
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons_profile.png'),
                title: Text('')
              ),
            ],
            onTap: (index) {
              setState(() {
                _pages = index;
              });
            },
          ),
        ),
        body: PagesController(_pages),
      ),
    );
  }
}
