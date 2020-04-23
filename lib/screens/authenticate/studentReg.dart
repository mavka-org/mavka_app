import 'package:flutter/material.dart';
import 'package:mavka/models/userInfo.dart';
import 'package:mavka/services/database.dart';

class StudentReg extends StatefulWidget {
  @override
  _StudentRegState createState() => _StudentRegState();
}

class _StudentRegState extends State<StudentReg> {
  @override
  Widget build(BuildContext context) {
    DatabaseService ds = DatabaseService(uid: User.get());
    ds.updateUserData("student", "Chebotok", "Nikita");
    return Container(
      child: Text("geaf"),
    );
  }
}
