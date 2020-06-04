import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;
  final bool isTitleBlack;
  final Widget customHeader;

  const PageLayout(
      {@required this.child,
      @required this.color,
      this.title,
      this.customHeader,
      this.isTitleBlack = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: color,
              height: 64,
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
                ],
              ),
            ),
            Expanded(
                child: Hero(
              tag: 'card0',
              child: Container(
                color: color,
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
              ),
            ))
          ],
        ),
      ),
    );
  }
}
