import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/social_auth.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/layouts/auth/intro.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroLayout(
        isHeaderSmall: false,
        child: Column(
          children: [
            FlatIconButtonComponent(
              onPressed: () {
                //todo use single bloc entry point
                context
                    .bloc<UserBloc>()
                    .add(UserSignInEvent(social: SocialAuth.google));
              },
              icon: FlutterIcons.google_faw5d,
              label: 'Увійти через Google',
            ),
            const SizedBox(
              height: 4,
            ),
            FlatIconButtonComponent(
              onPressed: () {
                context
                    .bloc<UserBloc>()
                    .add(UserSignInEvent(social: SocialAuth.facebook));
              },
              icon: FlutterIcons.facebook_f_faw5d,
              label: 'Увійти через Facebook',
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
                  child: OutlineButtonComponent(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/sign_up'),
                    text: 'Реєстрація',
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: OutlineButtonComponent(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/sign_in'),
                    text: 'Вхід',
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
