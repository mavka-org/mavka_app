part of 'question_type.dart';

class GeneralMatchingQuestionType extends QuestionType {
  List<GeneralMatchingQuestionQuestion> questions;
  List<GeneralMatchingQuestionVariant> variants;

  @override
  Widget getView() => GeneralMatchingQuestionView(this);

  void input(GeneralMatchingQuestionQuestion q, GeneralQuestionLetters s) {
    q.selected = s;
    testBloc.add(TestChangeQuestionStateEvent());
  }

  @override
  bool get validate {
    for (final q in questions) {
      if (q.selected == null) return null;
    }

    for (final q in questions) {
      if (q.selected != q.answer) return false;
    }

    return true;
  }
}

// todo proper validation
class GeneralMatchingQuestionQuestion {
  GeneralQuestionNumbers number;
  String text;
  GeneralQuestionLetters answer;
  GeneralQuestionLetters selected;
}

class GeneralMatchingQuestionVariant {
  GeneralQuestionLetters letter;
  String text;
}
