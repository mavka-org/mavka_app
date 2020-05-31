import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 80,
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      'Математика',
                      style: GoogleFonts.montserrat(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Hero(
              tag: 'card',
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(28)),
                child: Material(
                  color: Colors.grey[200],
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                      child: Column(
                        children: [
                          Text(
                              '123213213213asddddddddddddddddasddddddddddddddddddddddddddd')
                        ],
                      )),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
