import 'package:flutter/material.dart';
import 'package:mavka/components/page_indicators.dart';
import 'package:mavka/layouts/authorized/page.dart';
import 'package:mavka/model_views/question_types/general_matching.dart';
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
//          GeneralABCDQuestionView(GeneralABCDQuestionType()
//            ..variants = [
//              GeneralABCDQuestionVariant()
//                ..letter = GeneralQuestionLetters.a
//                ..text = 'option 1',
//              GeneralABCDQuestionVariant()
//                ..letter = GeneralQuestionLetters.b
//                ..text = 'option 2',
//              GeneralABCDQuestionVariant()
//                ..letter = GeneralQuestionLetters.c
//                ..text = 'option 3'
//                ..right = true,
//              GeneralABCDQuestionVariant()
//                ..letter = GeneralQuestionLetters.d
//                ..text = 'option 4',
//              GeneralABCDQuestionVariant()
//                ..letter = GeneralQuestionLetters.e
//                ..text = 'option 5',
//            ])

          GeneralMatchingQuestionView(GeneralMatchingQuestionType()
            ..questions = [
              GeneralMatchingQuestionQuestion()
                ..number = GeneralQuestionNumbers.n1
                ..text = 'q1'
                ..answer = GeneralQuestionLetters.a,
              GeneralMatchingQuestionQuestion()
                ..number = GeneralQuestionNumbers.n2
                ..text = 'q2'
                ..answer = GeneralQuestionLetters.b,
              GeneralMatchingQuestionQuestion()
                ..number = GeneralQuestionNumbers.n3
                ..text = 'q3'
                ..answer = GeneralQuestionLetters.d,
              GeneralMatchingQuestionQuestion()
                ..number = GeneralQuestionNumbers.n4
                ..text = 'q4'
                ..answer = GeneralQuestionLetters.c
            ]
            ..variants = [
              GeneralMatchingQuestionVariant()
                ..text = 'v1'
                ..letter = GeneralQuestionLetters.a,
              GeneralMatchingQuestionVariant()
                ..text = 'v2'
                ..letter = GeneralQuestionLetters.b,
              GeneralMatchingQuestionVariant()
                ..text = 'v3'
                ..letter = GeneralQuestionLetters.c,
              GeneralMatchingQuestionVariant()
                ..text = 'v4'
                ..letter = GeneralQuestionLetters.d
            ])
        ],
      ),
    );
  }
}
