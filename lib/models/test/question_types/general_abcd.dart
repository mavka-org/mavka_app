part of 'question_type.dart';

class GeneralABCDQuestionType extends QuestionType {
  List<GeneralABCDQuestionVariant> variants;

  bool validate(GeneralABCDQuestionVariant variant) => variant.right == true;
}

class GeneralABCDQuestionVariant {
  GeneralQuestionLetters letter;
  String text;
  bool right = false;
}
