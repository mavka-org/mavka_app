import 'package:flutter/material.dart';
import 'package:mavka/screens/home_pages/bookmarks.dart';
import 'package:mavka/screens/home_pages/home_page.dart';
import 'package:mavka/screens/home_pages/profile_page.dart';
import 'package:mavka/screens/material_pages/choose_class.dart';
import 'package:mavka/screens/material_pages/list_of_courses.dart';

class PagesController extends StatelessWidget {

  int page;
  PagesController(this.page);

  @override
  Widget build(BuildContext context) {

    switch(page){
      case 0:
        return HomePage();
        break;
      case 1:
        return ChooseClass();
        break;
      case 2:
        return Bookmarks();
        break;
      case 3:
        return Profile();
        break;
    }

  }
}
