part of 'question_type.dart';

class GeneralABCDQuestionType extends QuestionType {
  List<GeneralABCDQuestionVariant> variants;
  GeneralABCDQuestionVariant _selected;

  // todo store selected & right as index, but not as object/attribute

  // weird syntax: https://dart-lang.github.io/linter/lints/prefer_null_aware_operators.html
  @override
  bool get validate => _selected?.right;

  set input(GeneralABCDQuestionVariant s) {
    _selected = s;
    testBloc.add(TestChangeQuestionStateEvent());
  }

  GeneralABCDQuestionVariant get input => _selected;

  @override
  Widget getView() => GeneralABCDQuestionView(this);
}

class GeneralABCDQuestionVariant {
  // specify letter OR number not both
  GeneralQuestionLetters letter;
  GeneralQuestionNumbers number;
  String text;
  bool right = false;
}
