import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/course/course.dart';
import 'package:mavka/blocs/course/events.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/pages/course.dart';
import 'package:mavka/screens/intro.dart';
import 'package:mavka/screens/loading.dart';

import 'blocs/user/events.dart';
import 'screens/getting_started/getting_started.dart';
import 'screens/home.dart';
import 'screens/sign_in.dart';

void main() {
//  debugDefaultTargetPlatformOverride = TargetPlatform.linux;
//  defaultTargetPlatform = TargetPlatform.fuchsia;

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc()
            ..add(
              UserCheckEvent(),
            )),
      // todo handle connectivity issues
      BlocProvider<CourseBloc>(
          create: (BuildContext context) => CourseBloc()
            ..add(
              LoadCourseDatabaseEvent(),
            )),
    ],
    child: MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlue[600],
          accentColor: Colors.lightBlue[600],
// todo themes
//        textTheme: TextTheme(
//          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//        ),

          buttonTheme: const ButtonThemeData()),
      initialRoute: '/',
      routes: {
        '/': (context) => _Wrapper(),
        '/sign_in': (context) => SignInScreen(isSignInScreen: true),
        '/sign_up': (context) => SignInScreen(isSignInScreen: false),
        '/course': (context) => CoursePage()
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
          // todo loading screen
          if (state is UserUnauthorizedState) {
            return IntroScreen();
          } else if (state is UserAuthorizedState) {
            final bloc = context.bloc<UserBloc>();
            if (bloc.user.isStorageEmpty) {
              return GettingStartedScreen();
            } else {
              return HomeScreen();
            }
          } else {
            return LoadingScreen();
          }
        },
      );
}
