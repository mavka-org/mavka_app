import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoComponent extends StatelessWidget {
  final Color color;

  const LogoComponent(this.color);

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'logo',
        child: Material(
          color: Colors.transparent,
          child: Text(
            'mavka',
            style: GoogleFonts.montserrat(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 26,
                color: color),
          ),
        ),
      );
}
