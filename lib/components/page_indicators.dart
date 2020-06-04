import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPageIndicatorComponent extends StatelessWidget {
  final int currentPage;
  final int length;
  final Map<int, _ChipState> states;

  const TestPageIndicatorComponent(
      {@required this.length, @required this.currentPage, this.states});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final cardsAmount = constraints.maxWidth ~/ 26;
        var cards = <Widget>[];

        if (cardsAmount >= length) {
          cards = List.generate(
              length,
              (index) => chip(
                  index + 1,
                  currentPage == index + 1
                      ? _ChipState.active
                      : _ChipState.none)).toList();
        } else {
          // todo support more questions
          throw UnimplementedError('list is too big for this screen');
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: cards,
        );
      }),
    );
  }

  Widget chip([int page, _ChipState state = _ChipState.none]) => Padding(
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

enum _ChipState { active, notActive, done, error, none }

Color _chipState2color(_ChipState state) {
  switch (state) {
    case _ChipState.active:
      return Colors.blue[100];
      break;
    case _ChipState.notActive:
      return Colors.grey[300];
      break;
    case _ChipState.done:
      return Colors.green[100];
      break;
    case _ChipState.error:
      return Colors.red[100];
      break;
    case _ChipState.none:
      return Colors.white;
      break;
  }
  throw UnimplementedError();
}
