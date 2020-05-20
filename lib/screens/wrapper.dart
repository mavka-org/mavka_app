import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mavka/models/userInfo.dart';
import 'package:mavka/screens/authenticate/helloscreen/helloscreen.dart';
import 'package:mavka/screens/authenticate/onboarding_screen/type_page.dart';
import 'package:mavka/services/database.dart';
import 'package:mavka/shared/loading.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    CurrentUser.user = user;

    print("UPGRADE");
    print(user);

    if (user == null) {
      print("SIGN_IN_UP");
      return GettingStart();
    }
    DatabaseService ds = DatabaseService(user.uid);
    return FutureBuilder<bool>(
        future: ds.isInBase(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return Home();
            } else {
              return TypePage();
            }
          } else {
            return Loading();
          }
        });
  }
}
