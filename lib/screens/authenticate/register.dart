import 'package:mavka/services/auth.dart';
import 'package:mavka/shared/loading.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    isCorrectEmail ? TextFormField(
                      decoration: InputDecoration(
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    ) : TextFormField(
                      decoration: InputDecoration(
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
                          borderSide: BorderSide(
                              color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.red,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          if (email.length != 0)
                            isCorrectEmail = true;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    isCorrectPassword ? TextFormField(
                      decoration: InputDecoration(
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    ) : TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
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
                          borderSide: BorderSide(
                              color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.red,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                          if(password.length >= 6)
                            isCorrectPassword = true;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.white,
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 25,),
                      ),
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(
                            color: Color.fromRGBO(38, 132, 254, 100),
                            width: 1),
                      ),
                      highlightColor: Colors.blue[50],
                      highlightElevation: 5,
                      elevation: 2,
                      onPressed: () async {
                        if (password.length >= 6 ) {
                          if (email.length != 0) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'please supply a valid email';
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }else {
                            setState(() {
                              isCorrectEmail = false;
                            });
                          }
                        } else if (email.length == 0){
                          setState(() {
                            isCorrectPassword = false;
                            isCorrectEmail = false;
                          });
                        }else {
                          setState(() {
                            isCorrectPassword = false;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
