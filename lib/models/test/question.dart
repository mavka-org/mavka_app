import 'package:mavka/models/test/question_types/question_type.dart';

class Question {
  String text;
  QuestionType question;
  QuestionState state = QuestionState.none;
}

enum QuestionState { none, right, wrong, active }
