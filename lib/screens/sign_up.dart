import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('SignUp screen'),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:mavka/blocs/user/events.dart';
//import 'package:mavka/blocs/user/states.dart';
//import 'package:mavka/blocs/user/user.dart';
//import 'package:mavka/components/logo.dart';
//import 'package:mavka/utilities/validators.dart';
//
////todo design
////todo stless -> stful (for advanced validation & button activation/deactivation)
//class SignInScreen extends StatelessWidget {
//  final TextEditingController _emailController = TextEditingController();
//  final TextEditingController _passwordController = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: const Text('Авторизація'),
//        ),
//        body: Builder(builder: (context) {
//          return BlocListener<UserBloc, UserState>(
//              listener: (context, state) {
//                print('state upd: $state');
//                if (state is UserLoadingState) {
//                  Scaffold.of(context)
//                    ..hideCurrentSnackBar()
//                    ..showSnackBar(
//                      SnackBar(
//                        content: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: const [
//                            Text('Logging In...'),
//                            CircularProgressIndicator(),
//                          ],
//                        ),
//                      ),
//                    );
//                } else if (state is UserUnauthorizedState) {
//                  Scaffold.of(context)
//                    ..hideCurrentSnackBar()
//                    ..showSnackBar(
//                      SnackBar(
//                        content: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: const [
//                            Text('Login Failure'),
//                            Icon(Icons.error)
//                          ],
//                        ),
//                        backgroundColor: Colors.red,
//                      ),
//                    );
//                } else if (state is UserAuthorizedState) {
//                  Navigator.of(context).pop();
////                  print('good!');
//                }
//              },
//              child: Padding(
//                padding: const EdgeInsets.all(24),
//                child: Form(
//                    child: ListView(children: <Widget>[
//                      const SizedBox(height: 40),
//                      LogoComponent(Colors.black),
//                      const SizedBox(height: 40),
//                      TextFormField(
//                        controller: _emailController,
//                        decoration: const InputDecoration(
//                          icon: Icon(Icons.email),
//                          labelText: 'Email',
//                        ),
//                        keyboardType: TextInputType.emailAddress,
//                        autovalidate: true,
//                        autocorrect: false,
//                        validator: (_) {
//                          if (_emailController.text.isEmpty) {
//                            return 'Це поле не може бути пустим';
//                          } else if (!isEmailValid(_emailController.text)) {
//                            return 'Email не валідний';
//                          }
//                          return null;
//                        },
//                      ),
//                      TextFormField(
//                        controller: _passwordController,
//                        decoration: const InputDecoration(
//                          icon: Icon(Icons.lock),
//                          labelText: 'Password',
//                        ),
//                        obscureText: true,
//                        autovalidate: true,
//                        autocorrect: false,
//                        validator: (_) {
//                          if (_passwordController.text.isEmpty) {
//                            return 'Це поле не може бути пустим';
//                          }
//                          return null;
//                        },
//                      ),
//                      RaisedButton(
//                        onPressed: () {
////                      const snackBar = SnackBar(
////                        backgroundColor: Colors.lightBlue,
////                        behavior: SnackBarBehavior.floating,
////                        content: Text(
////                          'Snack bar test',
////                          style: TextStyle(color: Colors.white),
////                        ),
////                      );
////
////                      Scaffold.of(context).showSnackBar(snackBar);
//
//                          context.bloc<UserBloc>().add(UserSignInEvent(
//                            email: _emailController.text,
//                            password: _passwordController.text,
//                          ));
//
//                          print('added');
//                        },
//                        child: const Text('login'),
//                      )
//                    ])),
//              ));
//        }));
//  }
//}
////todo use export for bloc files
