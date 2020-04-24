import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/studentReg.dart';
import 'package:mavka/services/auth.dart';
import 'package:mavka/services/database.dart';
import 'package:provider/provider.dart';

final AuthService _auth = AuthService();

class CompleteReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseUser user = Provider.of<FirebaseUser>(context);
    DatabaseService ds = DatabaseService(user.uid);

    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Student',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentReg()));
                },
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Teacher',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {

                },
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Parent',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {

                },
              ),
            ],
        ),
      )
    );
  }
}
