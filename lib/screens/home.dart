import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'navigation/page_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: Container(
          height: 80,
          color: Colors.transparent,
          child: Hero(
            tag: 'bottom_navbar',
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(38)),
              child: BottomNavigationBar(
                  elevation: 18,
                  backgroundColor: Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: index,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey[500],
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(FlutterIcons.home_fea), title: Text('HOME')),
                    BottomNavigationBarItem(
                        icon: Icon(FlutterIcons.book_open_fea),
                        title: Text('?')),
                    BottomNavigationBarItem(
                        icon: Icon(FlutterIcons.check_sli),
                        title: Text('BOOKMARKS')),
                    BottomNavigationBarItem(
                        icon: Icon(FlutterIcons.user_fea),
                        title: Text('ACCOUNT')),
                  ],
                  onTap: (i) => setState(() => index = i)),
            ),
          ),
        ),
        body: SafeArea(child: PageBuilder(index)));
  }
}
