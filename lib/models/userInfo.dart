import 'package:firebase_auth/firebase_auth.dart';

class User {
  String _firstName;
  String _secondName;
  String _type;
  String _conId;

  User(String firstName, String secondName, String type){
    _firstName = firstName;
    _secondName = secondName;
    _type = type;
  }

  User.withConId(String firstName, String secondName, String type, String conId) {
    _firstName = firstName;
    _secondName = secondName;
    _type = type;
    _conId = conId;
  }

  String getConId() {
    return _conId;
  }
  String getFirstName() {
    return _firstName;
  }
  void setFirstName(String firstName) {
    _firstName = firstName;
  }

  String getSecondName() {
    return _secondName;
  }
  void setSecondName(String secondName) {
    _secondName = secondName;
  }

  String getType() {
    return _type;
  }
  void setType(String type) {
    _type = type;
  }
}

class CurrentUser{
  static FirebaseUser user;
  static String password;
  static String connectionId = null;
}