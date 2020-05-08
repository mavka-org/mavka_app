import 'package:flutter/material.dart';
import 'package:mavka/main.dart';
import 'package:mavka/models/userInfo.dart';
import 'package:mavka/models/userTypes.dart';
import 'package:mavka/services/database.dart';

import '../../home/home.dart';

class StudentReg extends StatefulWidget {
  @override
  _StudentRegState createState() => _StudentRegState();
}

class _StudentRegState extends State<StudentReg> {
  @override
  Widget build(BuildContext context) {
    DatabaseService ds = DatabaseService(CurrentUser.user.uid);
    ds.updateUserData(User.withConId("Chebotok", "Nikita", Type.student(), CurrentUser.connectionId));
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Далі'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()), (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
