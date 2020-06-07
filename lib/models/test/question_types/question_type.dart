import 'package:flutter/material.dart';
import 'package:mavka/model_views/question_types/general_abcd.dart';
import 'package:mavka/model_views/question_types/general_matching.dart';
import 'package:mavka/utilities/enum.dart';

part 'general_abcd.dart';
part 'general_matching.dart';

abstract class QuestionType {
  Widget getView();
}

class GeneralQuestionLetters extends Enum<String> {
  const GeneralQuestionLetters(String val) : super(val);

  static const GeneralQuestionLetters a = GeneralQuestionLetters('а');
  static const GeneralQuestionLetters b = GeneralQuestionLetters('б');
  static const GeneralQuestionLetters c = GeneralQuestionLetters('в');
  static const GeneralQuestionLetters d = GeneralQuestionLetters('г');
  static const GeneralQuestionLetters e = GeneralQuestionLetters('д');
}

class GeneralQuestionNumbers extends Enum<String> {
  const GeneralQuestionNumbers(String val) : super(val);

  static const GeneralQuestionNumbers n1 = GeneralQuestionNumbers('1');
  static const GeneralQuestionNumbers n2 = GeneralQuestionNumbers('2');
  static const GeneralQuestionNumbers n3 = GeneralQuestionNumbers('3');
  static const GeneralQuestionNumbers n4 = GeneralQuestionNumbers('4');
  static const GeneralQuestionNumbers n5 = GeneralQuestionNumbers('5');
}
