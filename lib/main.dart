import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/screens/loading.dart';

import 'blocs/user/events.dart';

void main() {
  runApp(BlocProvider<UserBloc>(
    create: (BuildContext context) => UserBloc()..add(UserCheckEvent()),
    child: MaterialApp(
//      routes: {
//        '/': (context) => const Scaffold(),
//      },
      home: _Wrapper(),
    ),
  ));
}

/// if gets too big, needs to be moved to another file
class _Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          //todo intercept auth errors (i e connectivity issues)
          //todo ui
          if (state is UserUninitializedState) {
            return LoadingScreen();
          }
          return Scaffold(
            body: Center(
              child: Text(state.toString()),
            ),
          );
        },
      );
}
