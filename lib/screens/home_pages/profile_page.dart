import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/sign_in.dart';
import 'package:mavka/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mavka/models/userInfo.dart';
import '../wrapper.dart';

class Profile extends StatefulWidget {
  static String curr = "vnimane";
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthService _authService = new AuthService();

  static void showInfoToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 8);
  }

  static void changeEmail(
      String newEmail, Function updateState, String currPassword) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    //Pass in the password to updatePassword.
    try {
      await _auth.signInWithEmailAndPassword(
          email: CurrentUser.user.email, password: currPassword);
    } catch (e) {
      print(
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(e.toString());
      showInfoToast("Неправильний пароль!");
      return;
    }
    user.updateEmail(newEmail).then((_) async {
      print("Succesfull changed email");
      CurrentUser.user = await _auth.currentUser();
      updateState();
      showInfoToast("Email змінено успішно");
    }).catchError((error) {
      print("Email can't be changed" + error.toString());
      showInfoToast("Помилка\nEmail не змінено");
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  static void changePassword(
      String newPassword, Function updateState, String currPassword) async {
    //Create an instance of the current user.
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    //Pass in the password to updatePassword.
    try {
      await _auth.signInWithEmailAndPassword(
          email: CurrentUser.user.email, password: currPassword);
    } catch (e) {
      print(
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(e.toString());
      showInfoToast("Неправильний пароль!");
      return;
    }
    user.updatePassword(newPassword).then((_) {
      print("Succesfull changed password");
      updateState();
      showInfoToast("Пароль змінено успішно");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      showInfoToast("Помилка\nПароль не змінено");
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print(CurrentUser.user.email);
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
                        "https://starpri.ru/wp-content/uploads/2019/02/mX2YdEeLJUo.jpg"),
                    radius: width / 5,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "User name",
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
                        CurrentUser.user.email,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: width / 100),
                      GestureDetector(
                        onTap: () {
                          showAlertDialog(
                              context, "Зміна email", "Введіть email", () {
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
                          "******",
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
                              context, "Зміна пароля", "Введіть пароль", () {
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
                    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Wrapper()), (Route<dynamic> route) => false);
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
  String psw = "";
  // set up the buttons
  Widget remindButton = FlatButton(
    child: Text("ОК"),
    onPressed: () {
      if (title == "Зміна пароля") {
        Profile.changePassword(tmp, f, psw);
      } else {
        Profile.changeEmail(tmp, f, psw);
      }
      f();
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Отмена"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Container(
      width: 100,
      height: 100,
      child: ListView(
        children: <Widget>[
          TextField(
            onChanged: (text) {
              psw = text;
            },
            decoration: InputDecoration(hintText: "Введіть поточний пароль"),
          ),
          TextField(
            onChanged: (text) {
              tmp = text;
            },
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
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
