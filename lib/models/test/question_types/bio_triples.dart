part of 'question_type.dart';

class BioTriplesQuestionType extends QuestionType {
  List<BioTriplesQuestionVariant> questions;

  @override
  bool get validate {
    for (final el in questions) {
      if (el.question.validate == null) return null;
      if (!el.question.validate) return false;
    }
    return true;
  }

  @override
  Widget getView() => BioTriplesQuestionView(this);
}

class BioTriplesQuestionVariant {
  GeneralABCDQuestionType question;
  String text;
}
