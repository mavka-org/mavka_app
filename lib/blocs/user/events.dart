import 'package:flutter/widgets.dart';
import 'package:mavka/blocs/user/social_auth.dart';
import 'package:mavka/models/user/storage.dart';
//toto replace to meta package

abstract class UserEvent {}

class UserSignUpEvent extends UserEvent {
  final String email;
  final String password;

  UserSignUpEvent({@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);
}

class UserSignInEvent extends UserEvent {
  final String email;
  final String password;
  final SocialAuth social;

  UserSignInEvent({this.email, this.password, this.social}) {
    // validation
    if (email != null || password != null) {
      assert(social == null);
      assert(email != null);
      assert(password != null);
    } else {
      assert(social != null);
      assert(email == null);
      assert(password == null);
    }
  }
}

class UserGettingStartedEvent extends UserEvent {
  final UserStorage storage;

  UserGettingStartedEvent({@required this.storage});
}

class UserCheckEvent extends UserEvent {}

class UserLogOutEvent extends UserEvent {}
