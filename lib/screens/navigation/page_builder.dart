import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/screens/navigation/user.dart';

import 'courses.dart';
import 'home.dart';

class PageBuilder extends StatelessWidget {
  final int index;

  const PageBuilder(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return HomeNavigationPage();
      case 1:
        return CoursesNavigationPage();
      case 3:
        return UserNavigationPage();

      default:
        return Center(
          child: RaisedButton(
              onPressed: () {
                context.bloc<UserBloc>().add(UserLogOutEvent());
              },
              child: const Text('Log out')),
        );
    }
  }
}
