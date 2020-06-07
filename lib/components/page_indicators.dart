import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/test/question.dart';

class TestPageIndicatorComponent extends StatelessWidget {
  final List<Question> questions;

  const TestPageIndicatorComponent(this.questions);

  @override
  Widget build(BuildContext context) {
    print('rebuilding');
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final cardsAmount = constraints.maxWidth ~/ 26;
          final cards = <Widget>[];

          if (cardsAmount >= questions.length) {
            var i = 1;
            for (final e in questions) {
              cards.add(chip(i, e.state));
              i++;
            }
          } else {
            // todo support more questions
            throw UnimplementedError('list is too big for this screen');
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: cards,
          );
        }));
  }

  Widget chip(int page, QuestionState state) => Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
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
  }
  throw UnimplementedError();
}
