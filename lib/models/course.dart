import 'package:flutter/material.dart';

class Course {
  String uid;
  String name;
  String form;
  String info;

  Course(
      {@required this.uid,
      @required this.name,
      @required this.form,
      @required this.info});
}

Widget courseTemplate(Course course, double width) {
  return Container(
    margin: const EdgeInsets.fromLTRB(4, 14, 4, 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.brown[200],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image(
              //todo: image for course and stuff
              image: const NetworkImage('todo'),
              width: width,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: width * 0.7,
              height: 10,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
                value: 0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'course text',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
