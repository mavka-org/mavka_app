part of 'question_type.dart';

class GeneralOpenQuestionType extends QuestionType {
  String answer;
  GeneralOpenQuestionInputType type;

  @override
  Widget getView() => GeneralOpenQuestionView(this);
}

enum GeneralOpenQuestionInputType {
  text,
  number
  // todo more types
}
