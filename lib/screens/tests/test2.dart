import 'package:flutter/material.dart';
import 'package:mavka/shared/hex_color.dart';

class Test2 extends StatefulWidget {
  Test2({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState2 createState() => _MyStatefulWidgetState2();
}

class _MyStatefulWidgetState2 extends State<Test2> {
  int current = -1;
  var func;
  void linkToContinue () {

  }

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
                padding: EdgeInsets.only(left: 105.0, top: 50.0),
                child: Container(
                  height: 5.0,
                  width: 20.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: HexColor("#152535"),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0, top: 50.0),
                child: Container(
                  height: 5.0,
                  width: 20.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: HexColor("#2684FE"),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(0.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 105.0),
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
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 5.0),
              child: Image(
                image: AssetImage("assets/test2.png"),
                width: 250.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 10.0),
              child: Text(
                  "2. Розрахуйте наведений вище\n інтеграл, використовуючи формулу\n Ньютона-Лейбніца."
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  new Radio(
                    value: 1,
                    groupValue: current,
                    onChanged: (int value) {
                      setState(() { current = value; });
                      func = linkToContinue;
                    },
                  ),
                  Text("8")
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  new Radio(
                    value: 2,
                    groupValue: current,
                    onChanged: (int value) {
                      setState(() { current = value; });
                      func = linkToContinue;
                    },
                  ),
                  Text("48")
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  new Radio(
                    value: 3,
                    groupValue: current,
                    onChanged: (int value) {
                      setState(() { current = value; });
                      func = linkToContinue;
                    },
                  ),
                  Text("14")
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  new Radio(
                    value: 4,
                    groupValue: current,
                    onChanged: (int value) {
                      setState(() {
                        current = value;
                        func = linkToContinue;
                      });
                    },
                  ),
                  Text("45")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 95.0),
            child: Container(
              height: 70.0,
              width: 280.0,
              child: RaisedButton(
                onPressed: func,
                child: Text(
                  "Відправити",
                  style: TextStyle(
                      color: HexColor("#FFFFFF")
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                color: HexColor("#2684FE"),
              ),
            ),
          )
        ],
      ),
    );
  }
}