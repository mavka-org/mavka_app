import 'package:flutter/material.dart';

import '../choose_course.dart';
class MotivationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Gilroy",
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    "Яка твоя мрія?",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 35, top: 30),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: Text(
                      "Що ти хочеш зробити зі своїми набутими знаннями?",
                      style: TextStyle(fontFamily: "Gilroy", fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Image(
                      image:
                      AssetImage("assets/sign_up_pic/sign_up_rocket.png"),
                      width: 200,
                      height: 200,
                      alignment: Alignment(1, 0),
                    ),
                    Positioned(
                      left: -240,
                      top: 100,
                      child: Container(
                        width: 300,
                        height: 70,
                        child: MaterialButton(
                          child: Text(
                            "Космічну ракету",
                            style:
                            TextStyle(fontFamily: "Gilroy", fontSize: 25),
                          ),
                          color: Color.fromRGBO(38, 132, 254, 100),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCourses()));
                          },
                          textColor: Colors.white,
                          height: 70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/sign_up_pic/sign_up_tree.png"),
                      width: 200,
                      height: 200,
                      alignment: Alignment(-1, 0),
                    ),
                    Positioned(
                      left: 100,
                      top: 100,
                      child: MaterialButton(
                        child: Text(
                          "Виростити красиву калину",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 25,
                          ),
                        ),
                        color: Color.fromRGBO(38, 132, 254, 100),
                        onPressed: () {},
                        height: 70,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Image(
                      image:
                      AssetImage("assets/sign_up_pic/sign_up_microbe.png"),
                      width: 200,
                      height: 180,
                      alignment: Alignment(1, 0),
                    ),
                    Positioned(
                      left: -215,
                      top: 65,
                      child: Container(
                        width: 300,
                        height: 80,
                        child: MaterialButton(
                          child: Center(
                            child: Text(
                              "Розробити вакцину проти Коронавірусу",
                              style:
                              TextStyle(fontFamily: "Gilroy", fontSize: 25),
                            ),
                          ),
                          color: Color.fromRGBO(38, 132, 254, 100),
                          onPressed: () {},
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
