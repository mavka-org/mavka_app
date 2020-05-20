import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Text('Обери курси 📚'),
            const Text('Лише для початку! Ти зможеш змінити їх потім'),
            CarouselSlider(
                items: null,
                options: CarouselOptions(scrollDirection: Axis.vertical))
          ],
        ),
      ),
      /*child: CarouselSlider(
          options: CarouselOptions(
              height: 400.0,
              scrollDirection: Axis.vertical
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber
                  ),
                  child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
               },
           );
        }).toList(),
      ),*/
    );
  }
}
