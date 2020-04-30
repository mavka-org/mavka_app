import 'package:flutter/material.dart';

class Course2 extends StatefulWidget {
  @override
  _Course2State createState() => _Course2State();
}

class _Course2State extends State<Course2> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: const  Radius.circular(25.0),
                        bottomRight: const  Radius.circular(25.0)),
                    color: Color(0xFF202EAB)
                ),
                child:Stack(
                  children: <Widget>[
                    Positioned(
                      left: width * 0.5,
                      child: Image(
                        image: AssetImage("assets/result.png"),
                        width: width * 0.3,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.3 * 0.2, 0, 0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0.75, height * 0.3 * 0.2, 0, 0),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.25 * 0.65, 0, 0),
                        child: Text(
                            'ЗНО математика',
                            style: TextStyle(
                              fontSize: 22.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40, vertical:10),
              child: Container(
                height: height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image:NetworkImage('https://www.mathmammoth.com/videos/grade_6/screenshot-inequalities-video.jpg'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.3 * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[100],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      width: width * 0.77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                              child: Text(
                                  'Первісна',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                child: Text(
                                    'Теорія',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[600],
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 0 ,0),
                                child: Text(
                                    'Практика',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[600],
                                    )
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.25 * 0.1),
                      child: Container(
                        width: width * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: const  Radius.circular(25.0),
                              bottomLeft: const  Radius.circular(25.0)),
                          color: Colors.green[200],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 6, 6, 4),
                              child: Text(
                                  '125',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                            Text(
                                'балів',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:height * 0.03),
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.9,
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
                        borderRadius: new BorderRadius.only(topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      color: Color(0xFF202EAB),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.7,
                  child: Image(
                    image: AssetImage("assets/result.png"),
                    width: width * 0.15,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

