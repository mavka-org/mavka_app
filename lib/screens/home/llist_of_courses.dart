
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mavka/models/course.dart';

class ListOfCourses extends StatefulWidget {
  @override
  _ListOfCoursesState createState() => _ListOfCoursesState();
}

Widget listTemplate(List <Course> courses, double height, double width){
      return Container(
        color: Colors.blueAccent,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: height / 2,
                  width: width / 2,
                  child:courseTemplate(courses[0], width / 2),
                ),
                Container(
                  height: height / 2,
                  width: width / 2,
                  child:courseTemplate(courses[1], width / 2),
                )
              ],
            ),
            Row(
              children: <Widget>[
                 Container(
                  height: height / 2,
                  width: width / 2,
                  child:courseTemplate(courses[2], width / 2),
                ),
                Container(
                  height: height / 2,
                  width: width / 2,
                  child:courseTemplate(courses[3], width / 2),
                )
              ],
            ),
          ],
        ),
      );
    }

class _ListOfCoursesState extends State<ListOfCourses> {
  

  String dropdownValue = 'One';
  List < List < Course > > currentCourses = [
   /* [
      Course(progress: 0.4, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Algebra'),
      Course(progress: 0.6, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Physics'),
      Course(progress: 0.7, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Astronomy'),
      Course(progress: 0.1, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Geometry'),
    ],
    [
      Course(progress: 0.2, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Geography'),
      Course(progress: 0.4, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Biology'),
      Course(progress: 0.3, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'History'),
      Course(progress: 0.5, url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU', text: 'Literature'),
    ]*/
  ];
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.75;
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
              child: CarouselSlider(
                items: currentCourses.map((course) => listTemplate(course, height, width)).toList(),
                options: CarouselOptions(
                    height: height * 1.02,
                    scrollDirection: Axis.vertical
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}