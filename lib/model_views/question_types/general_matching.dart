import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/test/question_types/question_type.dart';

class GeneralMatchingQuestionView extends StatefulWidget {
  final GeneralMatchingQuestionType model;

  const GeneralMatchingQuestionView(this.model);

  @override
  _GeneralMatchingQuestionViewState createState() =>
      _GeneralMatchingQuestionViewState();
}

class _GeneralMatchingQuestionViewState
    extends State<GeneralMatchingQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
                children: widget.model.questions
                    .map((e) => side(e.number.toString(), e.text))
                    .toList()),
            const Spacer(),
            Column(
                children: widget.model.variants
                    .map((e) => side(e.letter.toString(), e.text))
                    .toList()),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Column(children: [
          Row(children: [
            const SizedBox(
              width: 20,
            ),
            for (var v in widget.model.variants)
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Text(
                      v.letter.toString(),
                      style: GoogleFonts.montserratAlternates(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
              )
          ]),
          for (var e in widget.model.questions)
            Row(
              children: [
                Container(
                  height: 18,
                  width: 18,
                  child: Text(
                    e.number.toString(),
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                for (var l in widget.model.variants)
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() => widget.model.questions
                              .firstWhere(
                                  (element) => element.number == e.number)
                              .answer = l.letter);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: widget.model.questions
                                      .firstWhere((element) =>
                                          element.number == e.number)
                                      .answer ==
                                  l.letter
                              ? const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.blue,
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ),
                  )
              ],
            )
        ])
      ],
    );
  }

  Widget side(String box, String text) => Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Container(
              height: 26,
              width: 26,
              color: Colors.white,
              child: Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                child: Text(
                  box,
                  style: GoogleFonts.montserratAlternates(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: GoogleFonts.montserrat(fontSize: 14),
            )
          ],
        ),
      );

  Widget row() => Row(children: [
        cell(),
        cell(),
        cell(),
        cell(),
      ]);

  Widget cell() => Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(border: Border.all()),
      height: 22,
      width: 22);
}
