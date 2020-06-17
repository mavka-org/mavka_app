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
                letter: e.letter,
                onPressed: () => setState(() => widget.model.input = e),
              ))
          .toList());
}

class _CheckButtonComponent extends StatelessWidget {
  final GeneralQuestionLetters letter;
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
              '${letter.toString().toUpperCase()}:',
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
    // todo fix ui sizes (active border doesn't match with container sizes)
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ButtonTheme(
            height: 44,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              borderSide: BorderSide(
                  width: 1.4,
                  color: checked ? Colors.indigo[500] : Colors.white),
              onPressed: onPressed,
              highlightedBorderColor: Colors.indigo[500].withOpacity(0.8),
              child: body,
            )),
      ),
    );
  }
}
