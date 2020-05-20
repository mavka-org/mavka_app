import 'package:flutter/material.dart';

import '../../../shared/hex_color.dart';
import 'student_reg.dart';

class ChooseCourses extends StatefulWidget {
  @override
  _ChooseCoursesState createState() => _ChooseCoursesState();
}

class _ChooseCoursesState extends State<ChooseCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 70.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 105.0, top: 50.0),
            child: Container(
              height: 5.0,
              width: 20.0,
              child: RaisedButton(
                onPressed: () {},
                color: HexColor('#DCCCCD'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 50.0),
            child: Container(
              height: 5.0,
              width: 20.0,
              child: RaisedButton(
                onPressed: () {},
                color: HexColor('#EAEAEA'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 105.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(left: 35.0, top: 15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Обери курси',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 35.0, top: 15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Лише для початку! Ти зможеш \n'
            'змінити їх потім',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                height: 500,
                child: Stack(
                  children: <Widget>[
                    Container(
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          color: HexColor('#EAADBD'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                        )),
                    const Positioned(
                        top: 0,
                        left: 0,
                        child: Image(
                          width: 240,
                          height: 140,
                          image: AssetImage('assets/background1.jpg'),
                        )),
                    Center(
                      child: MaterialButton(
                        color: HexColor('2684FE'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentReg()));
                        },
                        child: const Text('Продовжити'),
                      ),
                    )
                  ],
                ))),
      ),
    ]));
  }
}
