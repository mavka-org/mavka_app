import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/models/user/storage.dart';
import 'package:mavka/models/user/user.dart';

class UserApi {
  final _auth = FirebaseAuth.instance;
  final _users = Firestore.instance.collection('users');
  final _googleSignIn = GoogleSignIn();
  final FacebookLogin _fbLogin = FacebookLogin();

  Future<User> signInWithEvent(UserSignInEvent event) async {
    //todo make it more readable & dry
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
        if (event.social == SocialAuth.google) {
          try {
            final googleSignInAccount = await _googleSignIn.signIn();

            final googleSignInAuthentication =
                await googleSignInAccount.authentication;
            final credential = GoogleAuthProvider.getCredential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken,
            );
            final authResult = await _auth.signInWithCredential(credential);
            final user = authResult.user;
            final storage = await _getUserStorage(user.uid);

            return User(user: user, storage: storage);
          } catch (e) {
            rethrow;
            print(e.toString());
            return null;
          }
        } else if (event.social == SocialAuth.facebook) {
          try {
//            print('123123123123123123123');
//
//            //_fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
            final FacebookLoginResult facebookLoginResult =
                await _fbLogin.logIn(['email']);
            print('123');
            print(facebookLoginResult.status);
            if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
              final facebookAccessToken = facebookLoginResult.accessToken;
              print('status is fine');
              final AuthCredential credential =
                  FacebookAuthProvider.getCredential(
                      accessToken: facebookAccessToken.token);
              final authResult = await _auth.signInWithCredential(credential);
              final FirebaseUser user = authResult.user;

              final storage = await _getUserStorage(user.uid);

              return User(user: user, storage: storage);
              return null;
            } else {
              return null;
            }
          } catch (e) {
            print(e.toString());
            print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            return null;
          }
        } else {
          throw UnimplementedError();
        }
      }
    } catch (e) {
      print('!!!!!!!!!!!!!UNHANDLED EXCEPTION!!!!!!!!!!');
      print(e.toString());
      rethrow;
    }
  }

  Future<User> signUpWithEvent(UserSignUpEvent event) async {
    try {
      final AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      final FirebaseUser user = result.user;

//      final storage = UserStorage(
//          firstName: 'John',
//          secondName: 'Doe',
//          type: UserType.student,
//          connectionId: '123');

//      await _users.document(user.uid).setData(storage.toMap);

      return User(user: user, storage: null);
    } catch (e) {
      return null;
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

  Future<UserStorage> _getUserStorage(final String uid) async {
    final document = await _users.document(uid).get();

    return document.exists ? UserStorage.fromMap(document.data) : null;
  }

  Future<void> logOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await _fbLogin.logOut();
  }
}
