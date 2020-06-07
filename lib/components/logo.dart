import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoComponent extends StatelessWidget {
  final Color color;
  final bool hero;

  const LogoComponent(this.color, {this.hero = true});

  @override
  Widget build(BuildContext context) => hero
      ? Hero(
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
        )
      : Text(
          'mavka',
          style: GoogleFonts.montserrat(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: color),
        );
}
