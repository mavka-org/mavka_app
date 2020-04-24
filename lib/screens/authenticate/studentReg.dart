import 'package:flutter/material.dart';
import 'package:mavka/models/currentUserID.dart';
import 'package:mavka/models/userInfo.dart';
import 'package:mavka/services/database.dart';

import '../home/home.dart';
import '../home/home.dart';

class StudentReg extends StatefulWidget {
  @override
  _StudentRegState createState() => _StudentRegState();
}

class _StudentRegState extends State<StudentReg> {
  @override
  Widget build(BuildContext context) {
    DatabaseService ds = DatabaseService(CurrentUserID.id);
    ds.updateUserData("student", "Chebotok", "Nikita");
    return Home();
  }
}
