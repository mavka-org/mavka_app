import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/models/user/storage.dart';
import 'package:mavka/models/user/user.dart';

class UserApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _users = Firestore.instance.collection('users');

  Future<User> signInWithEvent(UserSignInEvent event) async {
    try {
      if (event.social == null) {
        try {
          final AuthResult result = await _auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          final FirebaseUser user = result.user;

          final storage = await _getUserStorage(user.uid);

          return User(user: user, storage: storage);
        } catch (e) {
          // if user doesn't exist
          return null;
        }
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      print('!!!!!!!!!!!!!UNHANDLED EXCEPTION!!!!!!!!!!');
      print(e.toString());
      rethrow;
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser();
      assert(currentUser != null);

      final storage = await _getUserStorage(currentUser.uid);

      return User(storage: storage, user: currentUser);
    } catch (e) {
      return null;
    }
  }

  Future<UserStorage> _getUserStorage(final String uid) async =>
      UserStorage.fromMap((await _users.document(uid).get()).data);

  Future<void> logOut() => _auth.signOut();
}
