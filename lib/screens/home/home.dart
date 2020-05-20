import 'package:flutter/material.dart';

import '../../screens/home/pages.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    print('HOME');
    return SafeArea(
      child: Scaffold(
        // that's the background color for the whole application, don't use scaffold anywhere else
        backgroundColor: Colors.grey[100],
        bottomNavigationBar: Container(
          height: 80,
          child: ClipRRect(
            //todo: shadow in menu's box
            borderRadius: BorderRadius.vertical(top: Radius.circular(38)),
            child: BottomNavigationBar(
                elevation: 18,
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentPage,
                //todo hex -> Colors.*[*] (everywhere)
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey[500],
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('HOME')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.import_contacts), title: Text('?')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark), title: Text('BOOKMARKS')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), title: Text('ACCOUNT')),
                ],
                onTap: (index) => setState(() => _currentPage = index)),
          ),
        ),
        body: PagesController(_currentPage),
      ),
    );
  }
}
