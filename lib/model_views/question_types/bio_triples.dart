import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/model_views/question_types/general_abcd.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class BioTriplesQuestionView extends StatelessWidget {
  final BioTriplesQuestionType model;

  const BioTriplesQuestionView(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: model.questions
            .map((e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.text,
                      style: GoogleFonts.montserrat(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GeneralABCDQuestionView(e.question),
                  ],
                ))
            .toList());
  }
}
