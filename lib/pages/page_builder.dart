import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/user.dart';

class PageBuilder extends StatelessWidget {
  final int index;

  const PageBuilder(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
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
