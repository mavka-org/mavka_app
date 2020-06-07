import 'package:mavka/models/test/question.dart';

class Test {
  String name;
  String description;
  List<Question> questions;
  int _page = -1;

  int get page => _page;

  void _checkPage() {
    var i = 0;
    for (final q in questions) {
      if (q.state == QuestionState.active) {
        q.state = QuestionState.none;
      }
      if (i == _page) {
        q.state = QuestionState.active;
      }
      i++;
    }
  }

  void prevPage() {
    _page--;
    _checkPage();
  }

  void nextPage() {
    _page++;
    _checkPage();
  }
}
