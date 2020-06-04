part of 'question_type.dart';

class GeneralABCDQuestionType extends QuestionType {
  List<GeneralABCDQuestionVariant> variants;
}

class GeneralABCDQuestionVariant {
  GeneralABCDQuestionLetters letter;
  String text;
  bool right = false;
}

class GeneralABCDQuestionLetters extends Enum<String> {
  const GeneralABCDQuestionLetters(String val) : super(val);

  static const GeneralABCDQuestionLetters a = GeneralABCDQuestionLetters('а');
  static const GeneralABCDQuestionLetters b = GeneralABCDQuestionLetters('б');
  static const GeneralABCDQuestionLetters c = GeneralABCDQuestionLetters('в');
  static const GeneralABCDQuestionLetters d = GeneralABCDQuestionLetters('г');
}
