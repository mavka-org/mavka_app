import 'package:mavka/services/auth.dart';
import 'package:mavka/shared/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  
                  validator: (value) => value.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Пароль',),
                  validator: (value) => value.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 25),
                  ),
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: BorderSide(color: Color.fromRGBO(38, 132, 254, 100), width: 1),
                    ),
                    highlightColor: Colors.blue[50],
                    highlightElevation: 5,
                    elevation: 2,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'please supply a valid email';
                        });
                      }else{
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14
                  )
                )
              ],
            ),
          )),
    );
  }
}
