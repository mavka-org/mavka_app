import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;
  final bool isTitleBlack;
  final Widget customHeader;
  final Widget customHeaderEnd;
  final Widget belowHeader;
  final String hero;

  const PageLayout(
      {@required this.child,
      @required this.color,
      @required this.hero,
      this.title,
      this.customHeader,
      this.customHeaderEnd,
      this.belowHeader,
      this.isTitleBlack = false})
      : assert(title != null || customHeader != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 64,
              color: color,
              padding: const EdgeInsets.all(6),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: isTitleBlack ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: customHeader ??
                        Text(
                          title,
                          style: GoogleFonts.montserrat(
                              fontSize: 22,
                              color:
                                  isTitleBlack ? Colors.black : Colors.white),
                        ),
                  ),
                  if (customHeaderEnd != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: customHeaderEnd,
                    )
                ],
              ),
            ),
            if (belowHeader != null)
              Container(
                color: color,
                child: belowHeader,
              ),
            Expanded(
                child: Hero(
              tag: hero,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(28)),
                child: Material(
                  color: Colors.grey[200],
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 18),
                      child: Container(width: double.infinity, child: child)),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
