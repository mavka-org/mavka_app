import 'package:flutter/material.dart';
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
    ds.updateUserData(User("Chebotok", "Nikita", Type.student()));
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Далі'),
          onPressed: () {
            //Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
