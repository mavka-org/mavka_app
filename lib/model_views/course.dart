import 'package:flutter/material.dart';
import 'package:mavka/models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard(this.course);

  @override
  Widget build(BuildContext context) {
    return Text('${course.name} ${course.form}, ${course.info}');
  }
}
