import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(38)),
            child: BottomNavigationBar(
                elevation: 18,
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentPage,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey[500],
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(FlutterIcons.home_fea), title: Text('HOME')),
                  BottomNavigationBarItem(
                      icon: Icon(FlutterIcons.book_open_fea), title: Text('?')),
                  BottomNavigationBarItem(
                      icon: Icon(FlutterIcons.check_sli),
                      title: Text('BOOKMARKS')),
                  BottomNavigationBarItem(
                      icon: Icon(FlutterIcons.user_fea),
                      title: Text('ACCOUNT')),
                ],
                onTap: (index) => setState(() => _currentPage = index)),
          ),
        ),
        body: PagesController(_currentPage),
      ),
    );
  }
}
