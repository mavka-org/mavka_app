import 'package:firebase_auth/firebase_auth.dart';
import 'package:mavka/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final FirebaseUser user = Provider.of<FirebaseUser>(context);

    print("upgrade");
    print(user);

    if(user == null){
      print("auth");
      return Authenticate();
    }else{
      print("home");
      return (Home());
    }
  }
}
