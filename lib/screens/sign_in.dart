import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/components/logo.dart';

//todo design
//todo stless -> stful (for advanced validation & button activation/deactivation)
class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Builder(builder: (context) {
          return BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                print('state upd: $state');
                if (state is UserLoadingState) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Logging In...'),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    );
                } else if (state is UserUnauthorizedState) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Login Failure'),
                            Icon(Icons.error)
                          ],
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                } else if (state is UserAuthorizedState) {
                  Navigator.of(context).pop();
//                  print('good!');
                }
              },
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [LogoComponent(Colors.white)],
                  )),
                  Hero(
                    tag: 'card',
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),

//              decoration: const BoxDecoration(
//                  color: Colors.white,
//                  borderRadius:
//                      BorderRadius.vertical(top: Radius.circular(20))),
                      child: Material(
                        color: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 18),
                          child: Form(
                              child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                                const Text('// todo'),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.email),
                                    labelText: 'Email',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidate: true,
                                  autocorrect: false,
                                  validator: (_) {
                                    return null;

//                                if (_emailController.text.isEmpty) {
//                                  return 'Це поле не може бути пустим';
//                                } else if (!isEmailValid(
//                                    _emailController.text)) {
//                                  return 'Email не валідний';
//                                }
//                                return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.lock),
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                  autovalidate: true,
                                  autocorrect: false,
                                  validator: (_) {
                                    return null;

//                                if (_passwordController.text.isEmpty) {
//                                  return 'Це поле не може бути пустим';
//                                }
//                                return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                RaisedButton(
                                  onPressed: () => context
                                      .bloc<UserBloc>()
                                      .add(UserSignInEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      )),
                                  child: Text(
                                    'login',
                                    style: GoogleFonts.montserratAlternates(
                                        color: Colors.white),
                                  ),
                                )
                              ])),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        }));
  }
}
//todo use export for bloc files
