import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/screens/intro.dart';
import 'package:mavka/screens/loading.dart';

import 'blocs/user/events.dart';
import 'screens/home.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';

void main() {
  runApp(BlocProvider<UserBloc>(
    create: (BuildContext context) => UserBloc()..add(UserCheckEvent()),
    child: MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlue[600],
          accentColor: Colors.lightBlue[600],

//        textTheme: TextTheme(
//          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//        ),

          buttonTheme: const ButtonThemeData()),
      initialRoute: '/',
      routes: {
        '/': (context) => _Wrapper(),
        '/sign_in': (context) => SignInScreen(),
        '/sign_up': (context) => SignUpScreen()
      },
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
          if (state is UserUninitializedState || state is UserLoadingState) {
            return LoadingScreen();
          } else if (state is UserUnauthorizedState) {
            return IntroScreen();
          }
          if (state is UserAuthorizedState) {
            return HomeScreen();
          } else {
            return const Scaffold();
          }
        },
      );
}
