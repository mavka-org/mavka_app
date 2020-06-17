import 'package:mavka/models/test/question_types/question_type.dart';

class Question {
  String text;
  QuestionType question;
  QuestionState state = QuestionState.none;

  /// if we are done with this question
  /// return `true` if we can be done with this question ()
  void updState() {
    if (state == QuestionState.active && question.validate != null) {
      state = question.validate ? QuestionState.right : QuestionState.wrong;
    }
  }
}

enum QuestionState { none, right, wrong, active }
