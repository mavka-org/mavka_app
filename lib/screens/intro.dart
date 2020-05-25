import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/layouts/intro.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroLayout(
        isHeaderSmall: false,
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
                  //todo use single bloc entry point
                  context
                      .bloc<UserBloc>()
                      .add(UserSignInEvent(social: SocialAuth.google));
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
                  context
                      .bloc<UserBloc>()
                      .add(UserSignInEvent(social: SocialAuth.facebook));
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
                            fontWeight: FontWeight.w600, fontSize: 16),
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
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
