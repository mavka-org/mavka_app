import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/helloscreen/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slidelist[index].image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height) * 0.02,
        ),
        Text(
          slidelist[index].title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: (MediaQuery.of(context).size.height * 0.03),
          ),
          child: SizedBox(
            child: Text(
              slidelist[index].description,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            width: 200,
            height: 100,
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height) * 0.02,
        ),
      ],
    );
  }
}
