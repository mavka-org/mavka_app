import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/components/fields.dart';
import 'package:mavka/model_views/course.dart';
import 'package:mavka/utilities/random_color.dart';

class CoursesNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            children: [
              Text(
                'Каталог курсів',
                style: GoogleFonts.montserrat(
                    fontSize: 26, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(
                FlutterIcons.book_ent,
                color: randomColor4hand,
              ),
              const Spacer(),
              DropdownButton<String>(
                items: ['ЗНО'].map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: 'ЗНО',
                style: GoogleFonts.montserratAlternates(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                underline: Container(),
                onChanged: (_) {},
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: CoursesSearch(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: GridView.count(
            childAspectRatio: 1 / 1.16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: const [
              CourseCard(null),
              CourseCard(null),
              CourseCard(null),
              CourseCard(null),
              CourseCard(null),
              CourseCard(null),
              CourseCard(null),
              CourseCard(null),
            ],
          ),
        )
      ],
    );
  }
}
