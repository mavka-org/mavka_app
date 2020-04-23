import 'package:firebase_auth/firebase_auth.dart';
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
    DatabaseService ds = DatabaseService(uid: user.uid);

    return Container(
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
              ]
        ),
      )
    );
  }
}
