import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// if something is used more that once - make it a component (c)

class FlatButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double height;
  final double width;

  const FlatButtonComponent(
      {@required this.onPressed,
      @required this.text,
      this.height = 44,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) => ButtonTheme(
        height: height,
        minWidth: width,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          disabledColor: Colors.blueGrey,
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
        ),
      );
}

class FlatIconButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final IconData icon;
  final double height;
  final double width;

  const FlatIconButtonComponent(
      {@required this.onPressed,
      @required this.label,
      @required this.icon,
      this.height = 44,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) => ButtonTheme(
        height: height,
        minWidth: width,
        child: FlatButton.icon(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          label: Text(
            label,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
        ),
      );
}

class OutlineButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double height;
  final double width;

  const OutlineButtonComponent(
      {@required this.onPressed,
      @required this.text,
      this.height = 44,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) => ButtonTheme(
        height: height,
        minWidth: width,
        child: OutlineButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      );
}

class CheckButtonComponent extends StatelessWidget {
  final String text;
  final bool checked;
  final double height;
  final double width;
  final double fontSize;
  final EdgeInsets padding;
  final Function() onPressed;
  final SvgPicture svg;
  final bool radio;

  const CheckButtonComponent(
      {@required this.text,
      @required this.checked,
      this.height = 44,
      this.width = double.infinity,
      this.fontSize = 22,
      this.svg,
      this.radio = true,
      this.padding = const EdgeInsets.only(bottom: 12),
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final body = Row(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
            disabledColor: Colors.white,
          ),
          child: radio
              ? Radio(
                  value: checked,
                  groupValue: true,
                  onChanged: onPressed != null ? (_) => onPressed() : null,
                  activeColor: Colors.white,
                )
              : Checkbox(
                  onChanged: onPressed != null ? (data) => onPressed() : null,
                  value: checked,
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
                color: Colors.white),
          ),
        ),
        if (svg != null) svg
      ],
    );

    return Padding(
      padding: padding,
      child: Container(
        width: width,
        child: ButtonTheme(
            height: height,
            minWidth: width,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.blue,
              disabledColor: Colors.blueGrey,
              onPressed: onPressed,
              child: body,
            )),
      ),
    );
  }
}
