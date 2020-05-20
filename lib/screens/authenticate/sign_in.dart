import 'package:flutter/material.dart';
import 'package:mavka/services/auth.dart';
import 'package:mavka/shared/loading.dart';
import 'package:mavka/utilities/social_icons_icons.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            theme: ThemeData(fontFamily: 'Gilroy'),
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(38, 132, 254, 100)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(38, 132, 254, 100)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                ),
                              ),
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            Column(
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(38, 132, 254, 100)),
                                  ),
                                  highlightColor: Colors.blue[50],
                                  highlightElevation: 5,
                                  elevation: 2,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      final dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              'could not sign in with those credentials';
                                          loading = false;
                                        });
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                RaisedButton(
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(38, 132, 254, 100)),
                                  ),
                                  highlightColor: Colors.blue[50],
                                  highlightElevation: 5,
                                  elevation: 2,
                                  onPressed: () async {
                                    setState(() => loading = true);
                                    final result =
                                        await _auth.signInWithGoogle();
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'could not sign in with those credentials';
                                        loading = false;
                                      });
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Sign in with',
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(SocialIcons.google,
                                          color:
                                              Color.fromRGBO(38, 132, 254, 100))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                RaisedButton(
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(38, 132, 254, 100)),
                                  ),
                                  highlightColor: Colors.blue[50],
                                  highlightElevation: 5,
                                  elevation: 2,
                                  onPressed: () async {
                                    setState(() => loading = true);
                                    final result =
                                        await _auth.signInWithFacebook();
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'could not sign in with those credentials';
                                        loading = false;
                                      });
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Sign in with',
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(SocialIcons.facebook,
                                          color:
                                              Color.fromRGBO(38, 132, 254, 100))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Text(error,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 13))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
  }
}
