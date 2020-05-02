import 'package:firebase_auth/firebase_auth.dart';
import 'package:mavka/screens/wrapper.dart';
import 'package:mavka/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mavka/screens/home/home.dart';
import 'package:mavka/screens/pages/list_of_courses.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  static BuildContext tmpCon;

  Widget build(BuildContext context) {
    tmpCon = context;
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

