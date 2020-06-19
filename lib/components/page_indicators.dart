import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/test/question.dart';

class TestPageIndicatorComponent extends StatelessWidget {
  final List<Question> questions;
  final Function() onTap;

  const TestPageIndicatorComponent(this.questions, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            int cardsAmount = constraints.maxWidth ~/ 26;
            final cards = <Widget>[];

            if (cardsAmount >= questions.length) {
              var i = 1;
              for (final e in questions) {
                cards.add(chip(i, e.state));
                i++;
              }
            } else {
              if (cardsAmount % 2 == 0) {
                cardsAmount--;
              }
              final centerNum = cardsAmount ~/ 2 + 1;

              int offset = 0;
              if (getActiveIndex() + 1 > centerNum &&
                  questions.length - getActiveIndex() > centerNum) {
                print('1');
                offset = (getActiveIndex() + 1) - centerNum;
              } else if (questions.length - getActiveIndex() <= centerNum) {
                print('2');

                offset = questions.length - cardsAmount;
              }

              for (int i = offset; i < cardsAmount + offset; i++) {
                cards.add(chip(i + 1, questions[i].state));
              }
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: cards,
            );
          }),
        ),
      ),
    );
  }

  int getActiveIndex() {
    int i = 0;
    for (final el in questions) {
      if (el.state == QuestionState.active) return i;
      i++;
    }
    return 0;
  }

  Widget chip(int page, QuestionState state) => Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          margin: state == QuestionState.active
              ? const EdgeInsets.only(bottom: 4)
              : const EdgeInsets.only(),
          width: 20,
          height: 16,
          decoration: BoxDecoration(
              color: _chipState2color(state),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              page == null ? '..' : page.toString(),
              style: GoogleFonts.firaMono(fontSize: 12),
            ),
          ),
        ),
      );
}

Color _chipState2color(QuestionState state) {
  switch (state) {
    case QuestionState.active:
      return Colors.blue[100];
      break;
    case QuestionState.none:
      return Colors.grey[300];
      break;
    case QuestionState.right:
      return Colors.green[100];
      break;
    case QuestionState.wrong:
      return Colors.red[100];
      break;
    case QuestionState.filled:
      return Colors.yellow[100];
      break;
  }
  throw UnimplementedError();
}
