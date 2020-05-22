import 'package:bloc/bloc.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/models/user/user.dart';
import 'package:mavka/services/user_api.dart';

/// handles auth
class UserBloc extends Bloc<UserEvent, UserState> {
  final _api = UserApi();
  User user;

  @override
  UserState get initialState => UserUninitializedState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserCheckEvent) {
      final currentUser = await _api.getCurrentUser();
      if (currentUser != null) {
        user = currentUser;
        yield UserAuthorizedState();
      } else {
        yield UserUnauthorizedState();
      }
    } else if (event is UserSignInEvent) {
//      yield UserLoadingState();
//      print('singing in...');
//      _api.signInWithEvent(event);
    } else {
      throw UnimplementedError();
    }
  }
}
