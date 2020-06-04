import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/user/user.dart';
import 'package:mavka/components/fields.dart';
import 'package:mavka/model_views/course.dart';
import 'package:mavka/utilities/random_color.dart';

class HomeNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.bloc<UserBloc>();

    return ListView(
      // for annoying shadows when scrolling on android
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
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
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: CoursesSearch(),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Останні курси',
            style: GoogleFonts.montserrat(
                fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        // todo container -> expanded
        Container(
          height: 380,
          child: ListView(
            padding: const EdgeInsets.only(left: 26),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              CourseVerticalRecentCard(0),
              CourseVerticalRecentCard(1),
              CourseVerticalRecentCard(2),
              CourseVerticalRecentCard(3),
            ],
          ),
        ),
      ],
    );
  }

// dunno why but this sucks. ui i mean
//  Widget courseHorizontal() => ;

//  Widget course() =>
}
