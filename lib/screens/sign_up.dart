import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/states.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/layouts/intro.dart';

//todo design
//todo stless -> stful (for advanced validation & button activation/deactivation)
class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Builder(builder: (context) {
          return BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoadingState) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      //todo snackbar as a component
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Завантаження...'),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                } else if (state is UserUnauthorizedState) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        content: SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Помилка'),
                              Icon(Icons.error)
                            ],
                          ),
                        ),
                      ),
                    );
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
                      //todo button as a component
                      //todo validation for form
                      ButtonTheme(
                        height: 40,
                        minWidth: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.blue,
                          disabledColor: Colors.blueGrey,
                          onPressed: () {
                            context.bloc<UserBloc>().add(UserSignUpEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          },
                          child: Text(
                            'Зареєструватися',
                            style: GoogleFonts.montserratAlternates(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        height: 40,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Відмінити',
                            style: GoogleFonts.montserratAlternates(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ),
                    ])),
              ));
        }));
  }
}
