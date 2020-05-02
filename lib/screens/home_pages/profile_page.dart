import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/authenticate.dart';
import 'package:mavka/screens/authenticate/helloscreen/helloscreen.dart';
import 'package:mavka/services/auth.dart';

class Profile extends StatefulWidget {
  static String curr = "vnimane";
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthService _authService = new AuthService();


  static void changeEmail(String email) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    //Pass in the password to updatePassword.
    await _auth.signInWithEmailAndPassword(
        email: "ermakov@dlit.dp.ua", password: "111111");
    user.updateEmail(email).then((_) {
      print("Succesfull changed email");
    }).catchError((error) {
      print("Email can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  static void changePassword(String password) async {
    //Create an instance of the current user.
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    //Pass in the password to updatePassword.
    await _auth.signInWithEmailAndPassword(
        email: "ermakov@dlit.dp.ua", password: "228228");
    user.updatePassword(password).then((_) {
      print("Succesfull changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: EdgeInsets.only(left: width / 15, right: width / 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.esportnews.gg/pictures/content/29/29052_750.jpg"),
                    radius: width / 5,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'User name',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color: Colors.grey[650],
                        size: width / 15,
                      ),
                      SizedBox(width: width / 40),
                      Text(
                        'Дата реєстрації:',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'Registration date',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Colors.grey[650],
                        size: width / 15,
                      ),
                      SizedBox(width: width / 40),
                      Text(
                        'Адреса:',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'Adress',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.grey[650],
                        size: width / 15,
                      ),
                      SizedBox(width: width / 40),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: width / 100),
                      GestureDetector(
                        onTap: () {
                          print("vnimanie");
                          showAlertDialog(
                              context, "Новий email", "Введіть email", () {
                            setState(() {});
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey[650],
                          size: width / 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.security,
                        color: Colors.grey[650],
                        size: width / 15,
                      ),
                      SizedBox(width: width / 40),
                      Text(
                        'Пароль:',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: width * 0.4,
                        child: Text(
                          "Password",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(width: width / 40),
                      GestureDetector(
                        onTap: () {
                          print("vnimanie");
                          showAlertDialog(
                              context, "Новий пароль", "Введіть пароль", () {
                            setState(() {});
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey[650],
                          size: width / 15,
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Log out'),
                  onPressed: () async {
                    await Profile._authService.signOut();
                    print("ss");
                    //Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                ),
              ],
            ),
          )),
    );
  }
}

      showAlertDialog(BuildContext context, String title, String hint, Function f) {
        String tmp = "";
        // set up the buttons
        Widget remindButton = FlatButton(
          child: Text("ОК"),
          onPressed: () {
            if (title == "Новий пароль") {
              Profile.changePassword(tmp);
            } else {
              Profile.changeEmail(tmp);
            }
            Profile.curr = tmp;
            f();
            Navigator.pop(context);
          },
        );
        Widget cancelButton = FlatButton(
          child: Text("Отмена"),
          onPressed: () {
            Navigator.pop(context);
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text(title),
          content: TextField(
            onChanged: (text) {
              tmp = text;
            },
            decoration: InputDecoration(hintText: hint),
          ),
          actions: [
            remindButton,
            cancelButton,
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
