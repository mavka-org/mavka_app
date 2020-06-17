part of 'question_type.dart';

class GeneralOpenQuestionType extends QuestionType {
  String answer;
  String typed;
  GeneralOpenQuestionInputType type;

  @override
  Widget getView() => GeneralOpenQuestionView(this);

  // ignore: avoid_setters_without_getters
  set input(String str) {
    typed = str;
    testBloc.add(TestChangeQuestionStateEvent());
  }

  @override
  bool get validate =>
      (typed == null || typed.isEmpty) ? null : answer == typed;
}

enum GeneralOpenQuestionInputType {
  text,
  number
  // todo more types
}
