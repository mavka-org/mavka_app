part of 'question_type.dart';

class GeneralABCDQuestionType extends QuestionType {
  List<GeneralABCDQuestionVariant> variants;

  bool validate(GeneralABCDQuestionVariant variant) => variant.right == true;

  @override
  Widget getView() => GeneralABCDQuestionView(this);
}

class GeneralABCDQuestionVariant {
  GeneralQuestionLetters letter;
  String text;
  bool right = false;
}
