import 'package:flutter/material.dart';
import 'package:mavka/models/course.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.8;

    List <Course> courses = [
      Course(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcREM34Hb8LjIYGvGzP8LsloRt1kQfIGS0SD8Kwc2NzJbe_aolNf&usqp=CAU", text: "Math"),
      Course(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzQjq7w7-n-7vv9hLJ0_N3lJE3rFVtfjI3iRQimP0zmTerluRo&usqp=CAU", text: "Physics"),
      Course(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVaa0dOgmw5Ji9L5vtwvCp2YhdUejPx_IgmXrEsHvvotiI8tF0&usqp=CAU", text: "History"),
    ];

    Widget courseTemplate(course){
      return Container(
        //color: Colors.brown[200],
        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.brown[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image(
                  image: NetworkImage(course.url),
                  width: width,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  course.text,
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                //controller: editingController,
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
              height: width * 1.28,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: courses.map((course) => courseTemplate(course)).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
