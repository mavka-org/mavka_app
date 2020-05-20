import 'package:flutter/material.dart';
import 'package:mavka/services/auth.dart';
import 'package:mavka/shared/loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  bool isCorrectPassword = true;
  bool isCorrectEmail = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20.0),
                          if (isCorrectEmail)
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
                            )
                          else
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                labelText: 'Incorrect email',
                                labelStyle: TextStyle(color: Colors.red),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.red,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                  if (email.isNotEmpty) {
                                    isCorrectEmail = true;
                                  }
                                });
                              },
                            ),
                          const SizedBox(height: 20.0),
                          if (isCorrectPassword)
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
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            )
                          else
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                labelText: 'Incorrect password',
                                labelStyle: TextStyle(color: Colors.red),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.red,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                  if (password.length >= 6) {
                                    isCorrectPassword = true;
                                  }
                                });
                              },
                            ),
                          const SizedBox(height: 20.0),
                          RaisedButton(
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              side: const BorderSide(
                                  color: Color.fromRGBO(38, 132, 254, 100)),
                            ),
                            highlightColor: Colors.blue[50],
                            highlightElevation: 5,
                            elevation: 2,
                            onPressed: () async {
                              if (password.length >= 6) {
                                if (email.isNotEmpty) {
                                  setState(() => loading = true);
                                  final result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'please supply a valid email';
                                    });
                                  } else {
                                    Navigator.pop(context);
                                  }
                                } else {
                                  setState(() {
                                    isCorrectEmail = false;
                                  });
                                }
                              } else if (email.isEmpty) {
                                setState(() {
                                  isCorrectPassword = false;
                                  isCorrectEmail = false;
                                });
                              } else {
                                setState(() {
                                  isCorrectPassword = false;
                                });
                              }
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(error,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14))
                        ],
                      ),
                    ),
                  ],
                )),
          );
  }
}
