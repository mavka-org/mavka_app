import 'package:flutter/material.dart';
import 'package:mavka/models/test/question.dart';

class Test {
  String name;
  String description;
  List<Question> questions;
  int _page = -1;
  Color color;

  // todo is it ain't an exam
  bool isExam;

  bool canMoveForward = true;

  int get page => _page;

  void _checkPages() {
    // updating `canMoveForward`
//    canMoveForward = questions[_page].question.validate() != null;

    var i = 0;
    for (final q in questions) {
      if (q.state == QuestionState.active) {
        q.state = QuestionState.none;
        // todo mark pages that are done
        q.updState();
      }
      if (i == _page) {
        q.state = QuestionState.active;
      }
      i++;
    }
  }

  void prevPage() {
    _page--;
    _checkPages();
  }

  void nextPage() {
    _page++;
    _checkPages();
  }

  void checkCanMoveForward() {
    canMoveForward = questions[_page].question.validate != null;
    print('checked: $canMoveForward');
  }
}
