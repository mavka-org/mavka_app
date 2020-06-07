part of 'question_type.dart';

class GeneralMatchingQuestionType extends QuestionType {
  List<GeneralMatchingQuestionQuestion> questions;
  List<GeneralMatchingQuestionVariant> variants;

  @override
  Widget getView() => GeneralMatchingQuestionView(this);
//  bool validate(GeneralABCDQuestionVariant variant) => variant.right == true;
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
