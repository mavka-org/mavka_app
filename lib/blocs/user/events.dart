abstract class UserEvent {}

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

class UserCheckEvent extends UserEvent {}

class UserLogOutEvent extends UserEvent {}

class SocialAuth {
  //todo
}
