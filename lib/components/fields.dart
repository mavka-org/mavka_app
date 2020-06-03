import 'package:flutter/material.dart';

class CoursesSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 54,
        child: const TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: 'Пошук за курсами та темами',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search)),
        ),
      );
}
