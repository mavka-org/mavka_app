import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/components/logo.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [LogoComponent(Colors.white)],
            )),
            Hero(
              tag: 'card',
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),

//              decoration: const BoxDecoration(
//                  color: Colors.white,
//                  borderRadius:
//                      BorderRadius.vertical(top: Radius.circular(20))),
                child: Material(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18),
                    child: Column(
                      children: [
                        ButtonTheme(
                          height: 40,
                          minWidth: double.infinity,
                          child: FlatButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/sign_in');
                            },
                            icon: const Icon(
                              FlutterIcons.google_faw5d,
                              color: Colors.white,
                              size: 18,
                            ),
                            label: Text(
                              'Увійти через Google',
                              style: GoogleFonts.montserratAlternates(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        ButtonTheme(
                          height: 40,
                          minWidth: double.infinity,
                          child: FlatButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/sign_in');
                            },
                            icon: const Icon(
                              FlutterIcons.facebook_f_faw5d,
                              color: Colors.white,
                              size: 18,
                            ),
                            label: Text(
                              'Увійти через Facebook',
                              style: GoogleFonts.montserratAlternates(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey[400],
                                endIndent: 4,
                              ),
                            ),
                            Text(
                              'або використовуючи email',
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey[400],
                                indent: 4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonTheme(
                                height: 40,
                                child: OutlineButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/sign_up');
                                  },
                                  child: Text(
                                    'Реєстрація',
                                    style: GoogleFonts.montserratAlternates(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: ButtonTheme(
                                height: 40,
                                child: OutlineButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/sign_in');
                                  },
                                  child: Text(
                                    'Вхід',
                                    style: GoogleFonts.montserratAlternates(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
