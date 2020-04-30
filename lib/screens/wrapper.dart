import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mavka/models/userInfo.dart';
import 'package:mavka/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:mavka/services/database.dart';
import 'package:mavka/shared/loading.dart';
import 'package:provider/provider.dart';
import 'authenticate/completeReg.dart';

import 'home/home.dart';



class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final FirebaseUser user = Provider.of<FirebaseUser>(context);
    print("upgrade");
    print(user);

    if(user == null) {
      print("auth");
      return Authenticate();
    }
    print(user.uid);
    DatabaseService ds = DatabaseService(user.uid);
    CurrentUserID.id = user.uid;
    return FutureBuilder<bool>(
        future: ds.isInBase(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data){
              return Home();
            }
            else {
              return CompleteReg();
            }
          }else{
            return Loading();
          }
        }
    );
  }
}
