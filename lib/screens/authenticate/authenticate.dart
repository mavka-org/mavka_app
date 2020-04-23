import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/register.dart';
import 'package:mavka/screens/authenticate/sign_in.dart';
import 'package:mavka/screens/home/home.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Sign in'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
              }
            ),
            RaisedButton(
              child: Text('Sign up'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
            )
          ],
        ),
      ),
    );
  }
}
