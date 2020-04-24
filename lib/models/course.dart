import 'package:flutter/material.dart';

class Course{
  String url;
  String text;
  double progress;
  Course({this.url, this.text, this.progress});

}

 Widget courseTemplate(course, width){
      return Container(
        margin: EdgeInsets.fromLTRB(4, 14, 4, 14),
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
                  image: NetworkImage(course.url),
                  width: width,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: width * 0.7,
                  height: 10,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green,),
                    value: course.progress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
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