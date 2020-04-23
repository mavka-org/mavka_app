import 'package:flutter/material.dart';
import 'package:mavka/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    print("I am at home");
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
