import 'package:flutter/material.dart';
import 'package:mavka/components/page_indicators.dart';
import 'package:mavka/layouts/authorized/page.dart';
import 'package:mavka/model_views/question_types/general_abcd.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      color: Colors.indigo[300],
      customHeader:
          const TestPageIndicatorComponent(length: 12, currentPage: 1),
      child: Column(
        children: [
          GeneralABCDQuestionView(GeneralABCDQuestionType()
            ..variants = [
              GeneralABCDQuestionVariant()
                ..letter = GeneralABCDQuestionLetters.a
                ..text = 'option 1',
              GeneralABCDQuestionVariant()
                ..letter = GeneralABCDQuestionLetters.b
                ..text = 'option 2',
              GeneralABCDQuestionVariant()
                ..letter = GeneralABCDQuestionLetters.c
                ..text = 'option 3'
                ..right = true,
              GeneralABCDQuestionVariant()
                ..letter = GeneralABCDQuestionLetters.d
                ..text = 'option 4',
            ])
        ],
      ),
    );
  }
}
