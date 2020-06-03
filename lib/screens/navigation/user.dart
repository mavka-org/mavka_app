import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/events.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/models/user/types.dart';

class UserNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userBloc = context.bloc<UserBloc>();
    //UserLogOutEvent()
    return ListView(
      children: [
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CoolWhiteButton(
                  'Вийти з акаунту', () => userBloc.add(UserLogOutEvent())),
              CoolWhiteButton('Змінити пароль', () => print('change password')),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300], width: 4),
            shape: BoxShape.circle,
          ),
          child: Icon(
            FlutterIcons.user_astronaut_faw5s,
            size: 110,
            color: Colors.blue[400],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Center(
          child: Text(
            '${userBloc.user.storage.firstName} ${userBloc.user.storage.secondName}',
            style: GoogleFonts.montserrat(
                fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Center(
          child: Text(
            userType2localizedString(userBloc.user.storage.type),
            // todo use the same grey color for all secondary text
            style: GoogleFonts.montserratAlternates(
                fontSize: 16, color: Colors.grey[800]),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Padding(
          // todo the same padding everyehere
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Код',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                ),
              ),
              Text(
                'H00945',
                style: GoogleFonts.firaMono(fontSize: 16),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (!userBloc.user.isEmailEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Пошта',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
                Text(
                  userBloc.user.user.email,
                  style: GoogleFonts.firaMono(fontSize: 16),
                )
              ],
            ),
          )
      ],
    );
  }
}
