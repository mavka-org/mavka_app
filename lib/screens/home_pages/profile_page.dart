import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/authenticate.dart';
import 'package:mavka/services/auth.dart';

class Profile extends StatelessWidget {
  // ja vieby togo kto eche raz eto(next strocku) pomenyaet
  final AuthService _auth = AuthService();
  //
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
