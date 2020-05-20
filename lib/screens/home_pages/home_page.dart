import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/courses/course1.dart';
import 'package:mavka/screens/tests/test1.dart';
import 'package:mavka/shared/hex_color.dart';

class HomePage extends StatefulWidget {
  static BuildContext context;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CourseDemo> courses = [
    CourseDemo(
        name: 'ЗНО математика',
        secondName: 'До списку тем →',
        assetImage: const AssetImage('assets/background1.jpg')),
    CourseDemo(
        name: 'Астрономія',
        secondName: 'До списку тем →',
        assetImage: const AssetImage('assets/background2.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    HomePage.context = context;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: const <Widget>[
              SizedBox(
                width: 20.0,
              ),
              Text(
                'Привіт, Дарина! ✌',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 10, 20),
            child: Container(
              width: width,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor('F5F5F7'),
                    hintText: 'Шукай за темами для навчання',
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 6),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Останні курси',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CarouselSlider(
            items: courses
                .map((course) => courseTemplate(course, width, width * 1.1))
                .toList(),
            options: CarouselOptions(
              height: height * 1.15,
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}

Widget courseTemplate(CourseDemo course, double width, double height) {
  return Container(
    margin: const EdgeInsets.fromLTRB(4, 14, 4, 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      image: DecorationImage(
        image: course.assetImage,
        fit: BoxFit.cover,
      ),
      //color: Color(0xFF202EAB),
    ),
    child: Column(
      children: <Widget>[
        /*Expanded(
              child: Image(
                image: NetworkImage(course.right),
                width: width,
              ),
            ),*/
        GestureDetector(
          onTap: () {
            Navigator.push(HomePage.context,
                MaterialPageRoute(builder: (context) => Course1()));
          },
          child: Container(
            height: height * 0.79455,
            width: width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                image: DecorationImage(
                  image: course.assetImage,
                  fit: BoxFit.cover,
                )
                //color: Color(0xFF202EAB),
                ),
            child: Column(
              children: <Widget>[
                SizedBox(height: height * 0.85 * 0.7),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      course.name,
                      style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.1011,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: const Border(
                      top: BorderSide(color: Colors.blue, width: 2),
                      left: BorderSide(color: Colors.blue, width: 2),
                      right: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        course.secondName,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(HomePage.context,
                MaterialPageRoute(builder: (context) => const Test1()));
          },
          child: Container(
            height: height * 0.18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)),
              color: Colors.grey[200],
              border: const Border(
                  top: BorderSide(color: Colors.blue, width: 2),
                  left: BorderSide(color: Colors.blue, width: 2),
                  right: BorderSide(color: Colors.blue, width: 2),
                  bottom: BorderSide(color: Colors.blue, width: 2)),
            ),
            child: Row(
              children: const <Widget>[
                SizedBox(width: 20.0),
                Text(
                  'Пройти тест 🔥',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        /*Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                course.left,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),*/
      ],
    ),
  );
}

class CourseDemo {
  String name;
  String secondName;
  AssetImage assetImage;

  CourseDemo({this.name, this.secondName, this.assetImage});
}
