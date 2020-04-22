import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/brew.dart';
import 'package:mavka/screens/home/settigns_form.dart';
import 'package:mavka/services/auth.dart';
import 'package:mavka/services/database.dart';
import 'package:mavka/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettignsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().changes,
      child: loading ? Loading() : Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                setState(() => loading = true);
                await auth.signOut();
              },
              label: Text('Log out'),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _showSettingsPanel,
              color: Colors.black,
            )
          ],
        ),
        body: Container(
          child: BrewList(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover
          ),
        ),
      ),
    )
    );
  }
}

