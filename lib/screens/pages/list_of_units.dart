import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mavka/models/unit.dart';
import 'package:mavka/screens/pages/list_of_topics.dart';
import 'package:mavka/services/database.dart';
import 'package:mavka/shared/hex_color.dart';

class ListOfUnits extends StatefulWidget {
  final String courseID;
  final Map courseInfo;
  ListOfUnits({Key key, this.courseID, this.courseInfo}) : super(key: key);
  @override
  _ListOfUnitsState createState() => _ListOfUnitsState();
}

class _ListOfUnitsState extends State<ListOfUnits> {
  List<Color> colors = [HexColor("#DA5776"), HexColor("#202EAB"), HexColor("#E6E4E5"), HexColor("#A6AFFF"), HexColor("#A6AFFF"), HexColor("#A6EFFF")];
  List<Color> colors1 = [HexColor("#F9E6EA"), HexColor("#DEE0F2"), HexColor("#FBFBFB"), HexColor("#F2F3FF"), HexColor("#F2F3FF"), HexColor("#F2F3FF")];
  static double light (Color c) {
    return (c.red * 0.8 + c.green + c.blue * 0.2) / 510 * 100;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var getWidth = (double percent) {
      return width * percent / 100.0;
    };
    var getHeight = (double percent) {
      return height * percent / 100.0;
    };
    var units = (new DatabaseService("")).getAllUnitsWithId(this.widget.courseID);
    return Scaffold(
      body: FutureBuilder<List<Unit>>(
          future: units,
          builder: (context, c) {
            List<Unit> cc = c.data;
            List<Row> items = List();
            var widget = (i) {
              return Padding(
                padding: EdgeInsets.only(left: getWidth(8.7), top: getHeight(5.18)),
                child: Container(
                  height: getHeight(24.6),
                  width: getWidth(37.5),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        left: getWidth(3.31),
                        top: getHeight(6.86),
                        child: Container(
                          height: getHeight(20.35),
                          width: getWidth(31.52),
                          child: Opacity(
                            opacity: 0.25,
                            child: RaisedButton(
                              color: colors1[i % 6],
                              onPressed: () {},
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(""),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.0)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: getWidth(1.48),
                        top: getHeight(3.84),
                        child: Container(
                          height: getHeight(21.9),
                          width: getWidth(33.52),
                          child: RaisedButton(
                            color: colors1[i % 6],
                            onPressed: () {},
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(""),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0)
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: RaisedButton(
                          color: colors[i % 6],
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfTopics(courseName: this.widget.courseInfo['Name'], unitName: cc[i].getName())));
                          },
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              cc[i].getName() + "\n",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color:  light(colors[i % 6]) < 60.0 ? Colors.white : Colors.black,
                                  fontFamily: "Gilroy"
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.0)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            };
            items.add(Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: getWidth(8.7), top: getHeight(5.18)),
                  child: Text(
                    this.widget.courseInfo['Name'],
                    style: TextStyle(
                        fontFamily: "GilroyBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                )
              ],
            ));
            items.add(Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: getWidth(8.7), top: getHeight(1.18)),
                  child: Text(
                    this.widget.courseInfo['Info'] + "\nРозрахований для учнів " + this.widget.courseInfo['Form'].toString() + " класу",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 14
                    ),
                  ),
                )
              ],
            ));
            items.add(Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: getWidth(8.7), top: getHeight(5.18)),
                  child: Text(
                    "Розділи",
                    style: TextStyle(
                        fontFamily: "GilroyBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                )
              ],
            ));
            if (cc != null)
              for (int i = 0; i < cc.length; i += 2) {
                items.add(Row(
                  children: <Widget>[
                    widget(i),
                    i + 1 < cc.length ? widget(i + 1) : Text("")
                  ],
                ));
              }
            return DraggableScrollableSheet(
              initialChildSize: 1.0,
              minChildSize: 1.0,
              maxChildSize: 1.0,
              builder: (context, scrollContoller) {
                return ListView(
                  controller: scrollContoller,
                  children: items,
                );
              },
            );
          }
      ),
    );
  }
}
