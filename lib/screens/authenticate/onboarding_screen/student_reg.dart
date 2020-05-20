import 'package:flutter/material.dart';
import 'package:mavka/main.dart';
import 'package:mavka/models/user_info.dart';
import 'package:mavka/models/user_types.dart';
import 'package:mavka/services/database.dart';

class StudentReg extends StatefulWidget {
  @override
  _StudentRegState createState() => _StudentRegState();
}

class _StudentRegState extends State<StudentReg> {
  @override
  Widget build(BuildContext context) {
    final ds = DatabaseService(CurrentUser.user.uid);
    ds.updateUserData(User(
        firstName: 'Chebotok', secondName: 'Nikita', type: UserType.student));
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                (Route<dynamic> route) => false);
          },
          child: const Text('Далі'),
        ),
      ),
    );
  }
}
