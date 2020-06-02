abstract class UserState {}

class UserLoadingState extends UserState {}

class UserLoggedOutState extends UserState {}

/// value by default
class UserUninitializedState extends UserState {}

/// if there is no one logged in
class UserUnauthorizedState extends UserState {}

/// is user is logged in successfully
class UserAuthorizedState extends UserState {}

/// if there is something wrong with logging in
//class UserErrorState extends UserState {
//  todo
//  final String error;
//
//  UserErrorState(this.error);
//}
