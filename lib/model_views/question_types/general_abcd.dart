import 'package:flutter/material.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class GeneralABCDQuestionView extends StatefulWidget {
  final GeneralABCDQuestionType model;

  const GeneralABCDQuestionView(this.model);

  @override
  _GeneralABCDQuestionViewState createState() =>
      _GeneralABCDQuestionViewState();
}

class _GeneralABCDQuestionViewState extends State<GeneralABCDQuestionView> {
  GeneralABCDQuestionVariant active;

  // todo use similar style for all questions
  @override
  Widget build(BuildContext context) => Column(
      children: widget.model.variants
          .map((e) => CheckButtonComponent(
                checked: active == e,
                text: '${e.letter}) ${e.text}',
                onPressed: () => setState(() => active = e),
              ))
          .toList());
}
