import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class GeneralABCDQuestionView extends StatefulWidget {
  final GeneralABCDQuestionType model;

  const GeneralABCDQuestionView(this.model);

  @override
  _GeneralABCDQuestionViewState createState() =>
      _GeneralABCDQuestionViewState();
}

class _GeneralABCDQuestionViewState extends State<GeneralABCDQuestionView> {
  // todo use the same style for all types of questions
  @override
  Widget build(BuildContext context) => Column(
      children: widget.model.variants
          .map((e) => _CheckButtonComponent(
                checked: widget.model.input == e,
                text: e.text,
                letter: e.letter != null
                    ? e.letter.toString()
                    : e.number.toString(),
                onPressed: () => setState(() => widget.model.input = e),
              ))
          .toList());
}

class _CheckButtonComponent extends StatelessWidget {
  final String letter;
  final String text;
  final bool checked;
  final Function() onPressed;

  const _CheckButtonComponent(
      {@required this.text,
      @required this.checked,
      @required this.letter,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final body = Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Text(
              '$letter:',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.grey[800]),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.montserratAlternates(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.grey[800]),
              ),
            ),
          ],
        ));
    // todo use the same color for the test
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: checked ? Colors.indigo[500] : Colors.transparent,
                      width: 1.4)),
              child: body),
        ),
      ),
    );
  }
}
