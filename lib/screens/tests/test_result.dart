import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mavka/shared/hex_color.dart';


class TestResult extends StatefulWidget {
  TestResult({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState3 createState() => _MyStatefulWidgetState3();
}

class _MyStatefulWidgetState3 extends State<TestResult> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 30.0),
                child: IconButton(
                  onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  icon: Icon(
                    Icons.clear,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 50.0),
                child: Text(
                  "Результати",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 70.0),
                child: Icon(
                    Icons.more_vert
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Діагностичний тест",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "ЗНО Математика",
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  child: CircularProgressIndicator(
                    backgroundColor: HexColor("#EAEAEA"),
                    strokeWidth: 25.0,
                    value: 0.5,
                    valueColor: AlwaysStoppedAnimation<Color>(HexColor("#F1E702")),
                  ),
                ),
              ),
              Positioned(
                left: 80.0,
                top: 110.0,
                child: Text(
                  "50%",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 30.0),
              child: Text(
                "Неправильні завдання",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 15.0),
              child: Container(
                height: 40.0,
                width: 40.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: HexColor("#FBE1E4"),
                  child: Text("2"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Container(
                  height: 80.0,
                  width: 280.0,
                  child: RaisedButton(
                    onPressed: (){},
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Text(
                              "Теми до повторення ⚡",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                            child: Text(
                              "Дослідження функції: Теорія\nДослідження функції: Практика",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    ),
                    color: HexColor("#202EAB"),
                  ),
                ),
              ),
              Positioned(
                left: 240.0,
                top: 80.0,
                child: Image(
                  image: AssetImage("assets/result.png"),
                  width: 40.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}