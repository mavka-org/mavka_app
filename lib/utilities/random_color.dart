import 'dart:math';

import 'package:flutter/material.dart';

Color get randomColor4hand => [
      Colors.blue,
      Colors.red,
      Colors.purple,
      Colors.black,
      Colors.blueGrey,
      Colors.green,
      Colors.deepPurple,
      Colors.indigo,
      Colors.teal,
      Colors.deepPurple
    ][Random().nextInt(10)];
