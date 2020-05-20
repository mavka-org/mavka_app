import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    var color = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      color = 'FF$hexColor';
    }
    return int.parse(color, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
