import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard(this.course);

  @override
  Widget build(BuildContext context) {
    return Text('${course.name} ${course.form}, ${course.info}');
  }
}

// todo proper
class CourseVerticalRecentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 32),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue[300],
              borderRadius: BorderRadius.circular(18)),
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(26),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18))),
                  child: const Center(
                    child: Text(
                      '🔭',
                      style: TextStyle(fontSize: 44, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Астрономія',
                        style: GoogleFonts.montserrat(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Наступна тема:',
                        style: GoogleFonts.montserratAlternates(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Місяць',
                        style: GoogleFonts.montserrat(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(18)),
                child: InkWell(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(18)),
                  onTap: () {
                    Navigator.of(context).pushNamed('/course');
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        Text(
                          'Продовжити',
                          style: GoogleFonts.montserrat(fontSize: 22),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

class CourseHorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blue[400]),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      '🎱',
                      style: GoogleFonts.montserrat(
                          fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
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
