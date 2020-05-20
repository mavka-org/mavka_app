import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/helloscreen/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem(this.index);

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
              image: AssetImage(slideList[index].image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height) * 0.02,
        ),
        Text(
          slideList[index].title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: SizedBox(
            width: 200,
            height: 100,
            child: Text(
              slideList[index].description,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height) * 0.02,
        ),
      ],
    );
  }
}
