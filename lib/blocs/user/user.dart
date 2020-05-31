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
    print('incoming event: $event');

    switch (event.runtimeType) {
      case UserCheckEvent:
        final currentUser = await _api.getCurrentUser();
        if (currentUser != null) {
          user = currentUser;
          yield UserAuthorizedState();
        } else {
          yield UserUnauthorizedState();
        }
        break;

      case UserSignInEvent:
        yield UserLoadingState();

        print('singing in...');
        final u = await _api.signInWithEvent(event as UserSignInEvent);
        if (u == null) {
          yield UserUnauthorizedState();
        } else {
          user = u;
          yield UserAuthorizedState();
        }
        break;

      case UserSignUpEvent:
        yield UserLoadingState();

        print('singing up...');
        final u = await _api.signUpWithEvent(event as UserSignUpEvent);
        if (u == null) {
          yield UserUnauthorizedState();
        } else {
          user = u;
          yield UserAuthorizedState();
        }
        break;

      case UserLogOutEvent:
        // todo consider removing this line (for dry code)
        yield UserLoadingState();

        user = null;
        await _api.logOut();

        yield UserUnauthorizedState();
        break;

      case UserGettingStartedEvent:
        yield UserLoadingState();

        await _api.setUserStorage((event as UserGettingStartedEvent).storage);

        user = await _api.getCurrentUser();

        yield UserAuthorizedState();
        break;

      default:
        throw UnimplementedError();
    }
  }
}
