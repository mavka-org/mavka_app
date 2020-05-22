abstract class UserState {}

class UserLogInState extends UserState {}

class UserLoadingState extends UserState {}

class UserLogOutState extends UserState {}

/// value by default
class UserUninitializedState extends UserState {}

class UserUnauthorizedState extends UserState {}

class UserAuthorizedState extends UserState {}
