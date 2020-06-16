import 'package:flutter/material.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class GeneralOpenQuestionView extends StatelessWidget {
  final GeneralOpenQuestionType model;

  const GeneralOpenQuestionView(this.model);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        keyboardType: model.type == GeneralOpenQuestionInputType.number
            ? TextInputType.number
            : TextInputType.text,
        decoration: const InputDecoration(counterText: ''),
      ),
    );
  }
}
