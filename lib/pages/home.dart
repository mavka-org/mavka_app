import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/utilities/random_color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.bloc<UserBloc>();

    return ListView(
      // for annoying shadows when scrolling on android
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 26),
      children: [
        Row(
          children: [
            Text(
              'Привіт, ${bloc.user.storage.firstName}!',
              style: GoogleFonts.montserrat(
                  fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 2,
            ),
            Icon(
              FlutterIcons.hand_peace_mco,
              color: randomColor4hand,
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 54,
          child: const TextField(
            decoration: InputDecoration(
                filled: true,
                hintText: 'Пошук за курсами та темами',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Останні курси',
          style:
              GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        course(),
        course(),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/course');
          },
          child: const Text('press me'),
        )
      ],
    );
  }

  // dunno why but this sucks. ui i mean
  Widget course() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blue[400]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      '10/90',
                      style: GoogleFonts.montserrat(
                          fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Похідні',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.grey[100],
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Математика',
                      style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
