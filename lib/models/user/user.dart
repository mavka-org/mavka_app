import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'storage.dart';

class User {
  final FirebaseUser user;
  final UserStorage storage;

  User({@required this.user, @required this.storage});
}
