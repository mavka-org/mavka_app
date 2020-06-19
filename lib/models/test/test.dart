import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mavka/models/test/question.dart';

class Test {
  String name;
  String description;
  List<Question> questions;
  int _page = -1;
  Color color;

  Duration _duration;
  StreamController<Duration> timerStream = StreamController();

  // todo is it ain't an exam
  bool isExam;

  bool canMoveForward = true;

  int get page => _page;

  // ignore: avoid_setters_without_getters
  set duration(Duration d) {
    _duration = d;
    timerStream.add(_duration);
  }

  bool get isDuration => _duration != null;

  bool _timerRunning = false;

  Future<void> _timerRunner() async {
    while (true) {
      _duration = Duration(seconds: _duration.inSeconds - 1);
      timerStream.add(_duration);
      if (_duration.inSeconds <= 0) break;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void _checkPages() {
    var i = 0;
    for (final q in questions) {
      if (q.state == QuestionState.active) {
        q.state = QuestionState.none;
        // todo mark pages that are done
        q.updState(showAnswer: !isExam);
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
    if (page == -1 && !_timerRunning && _duration != null) {
      _timerRunning = true;
      _timerRunner();
    }
    _page++;
    _checkPages();
  }

  void checkCanMoveForward() {
    if (_page != -1) {
      canMoveForward = questions[_page].question.validate != null;
      print('checked: $canMoveForward');
    }
  }

  Test clone() {
    return Test()
      ..duration = _duration
      ..name = name
      ..description = description
      ..isExam = isExam
      ..questions = questions;
  }
}
