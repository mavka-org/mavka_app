import 'package:flutter/cupertino.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class Question {
  String text;
  QuestionType question;
  QuestionState state = QuestionState.none;

  /// updates the state of the question
  void updState({@required bool showAnswer}) {
    if (showAnswer) {
//      print('state was set ' +
//          question.validate.toString() +
//          ' ' +
//          state.toString());

      if (question.validate != null) {
        state = question.validate ? QuestionState.right : QuestionState.wrong;
      }
    } else if (question.validate != null) {
      state = QuestionState.filled;
    }
  }
}

enum QuestionState { none, right, wrong, active, filled }
