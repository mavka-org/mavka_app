import 'package:flutter/material.dart';

class Slide {
  final String image;
  final String title;
  final String description;

  Slide({
    @required this.image,
    @required this.title,
    @required this.description,
  });
}

final List<Slide> slideList = <Slide>[
  Slide(
      image: 'assets/sign_up_pic/sign_up_inform.png',
      title: 'lolololololololololololol',
      description: 'lalalalalalaalalalalalal'),
  Slide(
      image: 'assets/sign_up_pic/sign_up_inform.png',
      title: 'lolololololololololololol',
      description: 'lalalalalalaalalalalalal'),
  Slide(
      image: 'assets/sign_up_pic/sign_up_inform.png',
      title: 'lolololololololololololol',
      description: 'lalalalalalaalalalalalal'),
];
