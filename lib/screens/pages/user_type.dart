import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class UserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(
          child: Center(
              child: RoundedProgressBar(
                style: RoundedProgressBarStyle(
                    borderWidth: 0,
                    widthShadow: 0),
                margin: EdgeInsets.symmetric(vertical: 16),
                borderRadius: BorderRadius.circular(24),
                percent: 30,
                theme: RoundedProgressBarTheme.red,
              ),
          ),
      );
  }
}