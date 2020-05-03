import 'package:flutter/material.dart';
import 'package:mavka/screens/home_pages/profile_page.dart';
import 'package:mavka/screens/material_pages/list_of_courses.dart';
import 'bookmarks.dart';
import 'home_page.dart';

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
        return ListOfCourses();
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
