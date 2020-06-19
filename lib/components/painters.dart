import 'dart:math';

import 'package:flutter/material.dart';

class StripperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)));

    for (int i = 0; i < max(size.height, size.width) * 2; i += 8) {
      canvas.drawLine(
          Offset(0, i / 1),
          Offset(i / 1, 0),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 0.8);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
