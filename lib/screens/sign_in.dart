import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/components/snackbar.dart';
import 'package:mavka/layouts/intro.dart';

//todo design
//todo stless -> stful (for advanced validation & button activation/deactivation)
class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool isSignInScreen;

  SignInScreen({@required this.isSignInScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Builder(builder: (context) {
          return BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoadingState) {
                  showSnackBarComponent(
                      SnackBarType.loading, 'Завантаження...', context);
                } else if (state is UserUnauthorizedState) {
                  showSnackBarComponent(
                      SnackBarType.error,
                      isSignInScreen
                          ? 'Помилка. Обліковий запис не існує'
                          : 'Помилка',
                      context);
                } else if (state is UserAuthorizedState) {
                  Navigator.of(context).pop();
//                  print('good!');
                }
              },
              child: IntroLayout(
                child: Form(
                    child: ListView(
                        physics: const ScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Поштова скринька',
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
                          labelText: 'Пароль',
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
                      //todo validation for form
                      FlatButtonComponent(
                        onPressed: () {
                          if (isSignInScreen) {
                            context.bloc<UserBloc>().add(UserSignInEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          } else {
                            context.bloc<UserBloc>().add(UserSignUpEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          }
                        },
                        text: isSignInScreen ? 'Увійти' : 'Зареєструватися',
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      OutlineButtonComponent(
                        onPressed: () => Navigator.of(context).pop(),
                        text: 'Відмінити',
                      ),
                    ])),
              ));
        }));
  }
}
//todo use export for bloc files
