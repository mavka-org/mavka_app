import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mavka/models/course.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.8;

    List <Course> courses = [
      Course(progress: 0.2, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcREM34Hb8LjIYGvGzP8LsloRt1kQfIGS0SD8Kwc2NzJbe_aolNf&usqp=CAU", text: "Math"),
      Course(progress: 0.4, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU", text: "Physics"),
      Course(progress: 0.8, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVaa0dOgmw5Ji9L5vtwvCp2YhdUejPx_IgmXrEsHvvotiI8tF0&usqp=CAU", text: "History"),
    ];

   

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                    )
                ),
              ),
            ),
            Container(
              child: CarouselSlider(
                items: courses.map((course) => courseTemplate(course, width)).toList(),
                options: CarouselOptions(height: width * 1.28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
