import 'package:flutter/material.dart';
import 'package:mavka/screens/home_pages/bookmarks.dart';
import 'package:mavka/screens/home_pages/home_page.dart';
import 'package:mavka/screens/home_pages/profile_page.dart';
import 'package:mavka/screens/material_pages/choose_class.dart';

class PagesController extends StatelessWidget {
  final int page;

  const PagesController(this.page);

  @override
  Widget build(BuildContext context) {
    switch (page) {
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
      default:
        return const Center(child: Text('critical paging error'));
        break;
    }
  }
}
