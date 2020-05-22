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
//
//      final AuthResult result = await _auth.signInWithEmailAndPassword(
//          email: email, password: password);
//      final FirebaseUser user = result.user;
//
//      print(result.additionalUserInfo.username);
//      print(result.additionalUserInfo.profile);
//      print(result.user.email);
//      print(result.user.uid);
//
//      print('----');
//
//      final ds = await _users.document(result.user.uid).get();
//
//      print(ds.data);

//      print(result.user.);
      return null;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser();
      assert(currentUser != null);

      final storage = await _users.document(currentUser.uid).get();

      return User(
          storage: UserStorage.fromMap(storage.data), user: currentUser);
    } catch (e) {
      return null;
    }
  }
}
