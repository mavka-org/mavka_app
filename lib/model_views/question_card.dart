import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/test/question.dart';

class QuestionCardView extends StatelessWidget {
  final Function() onTap;
  final Question e;
  final String num;

  const QuestionCardView(this.e, this.num, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // todo as a component & better index search
              const SizedBox(width: 4),
              Text(
                num,
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500]),
              ),
              const SizedBox(width: 8),
              // todo as a function
              Text(
                (e.state == QuestionState.none ||
                        e.state == QuestionState.active)
                    ? 'Не виконано'
                    : 'Виконано',
                style: GoogleFonts.montserrat(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
