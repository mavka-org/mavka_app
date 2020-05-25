import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// todo component

class FlatButtonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// todo component
class OutlineButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double height;
  final double width;

  const OutlineButtonComponent(
      {@required this.onPressed,
      @required this.text,
      this.height = 36,
      this.width = 88});

  @override
  Widget build(BuildContext context) => ButtonTheme(
        height: height,
        minWidth: width,
        child: OutlineButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            text,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      );
}
