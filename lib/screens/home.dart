import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/user.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            onPressed: () {
              context.bloc<UserBloc>().add(UserLogOutEvent());
            },
            child: const Text('Log out')),
      ),
    );
  }
}
