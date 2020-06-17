import 'package:flutter/material.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class GeneralOpenQuestionView extends StatelessWidget {
  final GeneralOpenQuestionType model;

  const GeneralOpenQuestionView(this.model);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    controller.text = model.typed ?? '';

    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    controller.addListener(() => model.input = controller.text);
    return Center(
      child: TextField(
        keyboardType: model.type == GeneralOpenQuestionInputType.number
            ? TextInputType.number
            : TextInputType.text,
        controller: controller,
        decoration:
            const InputDecoration(counterText: '', hintText: 'Відповідь'),
      ),
    );
  }
}
