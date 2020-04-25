import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/authenticate.dart';

class Profile extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Log out'),
          onPressed: () async {
            await _auth.signOut();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
    );
  }
}
