import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'user_types.dart';

class User {
  String firstName;
  String secondName;
  UserType type;
  String conId;

  User(
      {@required this.firstName,
      @required this.secondName,
      @required this.type,
      this.conId});
}

class CurrentUser {
  static FirebaseUser user;
  static String password;
  static String connectionId;
}
