import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _fbLogin = FacebookLogin();
  Stream<FirebaseUser> get user{
    return _auth.onAuthStateChanged;
  }

  /*Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }*/

  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    try{
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      AuthResult authResult = await _auth.signInWithCredential(credential);
      FirebaseUser user = authResult.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithFacebook() async {
    try {
      //_fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
      final FacebookLoginResult facebookLoginResult = await _fbLogin.logInWithReadPermissions(['email']);
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
        AuthResult authResult = await _auth.signInWithCredential(credential);
        FirebaseUser user = authResult.user;
        return user;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      if(await _fbLogin.isLoggedIn){
        //print('fb_out');
        await _fbLogin.logOut();
        //print('fb_out2');
      }
      if(await _googleSignIn.isSignedIn()){
        await _googleSignIn.signOut();
      }
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}