import 'package:bloc/bloc.dart';
import 'package:mavka/blocs/test/events.dart';
import 'package:mavka/models/test/question.dart';
import 'package:mavka/models/test/question_types/question_type.dart';
import 'package:mavka/models/test/test.dart';
import 'package:mavka/utilities/wrapper.dart';

class TestBloc extends Bloc<TestEvent, Wrapper<Test>> {
  @override
  Wrapper<Test> get initialState => Wrapper(Test());

  // todo dunno, probably shouldn't store data like that, needs review
  Test _test;

  Wrapper<Test> get wrapper => Wrapper(_test);

  @override
  Stream<Wrapper<Test>> mapEventToState(TestEvent event) async* {
    final q1 = Question()
      ..text = 'question #1 text'
      ..question = (GeneralABCDQuestionType()
        ..testBloc = this
        ..variants = [
          GeneralABCDQuestionVariant()
            ..letter = GeneralQuestionLetters.a
            ..text = 'option 1',
          GeneralABCDQuestionVariant()
            ..letter = GeneralQuestionLetters.b
            ..text = 'option 2',
          GeneralABCDQuestionVariant()
            ..letter = GeneralQuestionLetters.c
            ..text = 'option 3'
            ..right = true,
          GeneralABCDQuestionVariant()
            ..letter = GeneralQuestionLetters.d
            ..text = 'option 4',
          GeneralABCDQuestionVariant()
            ..letter = GeneralQuestionLetters.e
            ..text = 'option 5',
        ]);
    final q2 = Question()
      ..text = r'question #2 text here: $$\frac{1}{2}! \neq \frac{1}{2}$$'
      ..question = (GeneralMatchingQuestionType()
        ..testBloc = this
        ..questions = [
          GeneralMatchingQuestionQuestion()
            ..number = GeneralQuestionNumbers.n1
            ..text = 'q1'
            ..answer = GeneralQuestionLetters.a,
          GeneralMatchingQuestionQuestion()
            ..number = GeneralQuestionNumbers.n2
            ..text = 'q2'
            ..answer = GeneralQuestionLetters.b,
          GeneralMatchingQuestionQuestion()
            ..number = GeneralQuestionNumbers.n3
            ..text = 'q3'
            ..answer = GeneralQuestionLetters.d,
          GeneralMatchingQuestionQuestion()
            ..number = GeneralQuestionNumbers.n4
            ..text = 'q4'
            ..answer = GeneralQuestionLetters.c
        ]
        ..variants = [
          GeneralMatchingQuestionVariant()
            ..text = 'v1'
            ..letter = GeneralQuestionLetters.a,
          GeneralMatchingQuestionVariant()
            ..text = 'v2'
            ..letter = GeneralQuestionLetters.b,
          GeneralMatchingQuestionVariant()
            ..text = 'v3'
            ..letter = GeneralQuestionLetters.c,
          GeneralMatchingQuestionVariant()
            ..text = 'v4'
            ..letter = GeneralQuestionLetters.d
        ]);

    final q3 = Question()
      ..text = 'math open question'
      ..question = (GeneralOpenQuestionType()
        ..testBloc = this
        ..answer = '90');
    final q4 = Question()
      ..text = 'bio triples question'
      ..question = (BioTriplesQuestionType()
        ..testBloc = this
        ..questions = [
          BioTriplesQuestionVariant()
            ..text = 'question 1'
            ..question = (GeneralABCDQuestionType()
              ..testBloc = this
              ..variants = [
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n1
                  ..text = 'option 1'
                  ..right = true,
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n2
                  ..text = 'option 2',
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n3
                  ..text = 'option 3'
              ]),
          BioTriplesQuestionVariant()
            ..text = 'question 2'
            ..question = (GeneralABCDQuestionType()
              ..testBloc = this
              ..variants = [
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n1
                  ..text = 'option 1'
                  ..right = true,
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n2
                  ..text = 'option 2',
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n3
                  ..text = 'option 3'
              ]),
          BioTriplesQuestionVariant()
            ..text = 'question 3'
            ..question = (GeneralABCDQuestionType()
              ..testBloc = this
              ..variants = [
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n1
                  ..text = 'option 1'
                  ..right = true,
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n2
                  ..text = 'option 2',
                GeneralABCDQuestionVariant()
                  ..number = GeneralQuestionNumbers.n3
                  ..text = 'option 3'
              ])
        ]);

    switch (event.runtimeType) {
      case TestStartEvent:
        _test = Test()
          ..duration = const Duration(hours: 3)
          ..name = 'Test title'
          ..description = 'test description'
          ..isExam = true
          ..questions = [q1, q2, q3, q4];

        yield wrapper;
        break;

      case TestNextPageEvent:
        _test.page = _test.page + 1;
        if (_test.questions.length > _test.page) {
          _test.checkCanMoveForward();
        }
        yield wrapper;
        break;

      case TestPrevPageEvent:
        _test.page = _test.page - 1;

        if (_test.page != -1) _test.checkCanMoveForward();
        yield wrapper;
        break;

      case TestJumpPageEvent:
        _test.page = (event as TestJumpPageEvent).page;

        if (_test.page != -1 || _test.questions.length > _test.page) {
          _test.checkCanMoveForward();
        }

        yield wrapper;
        break;

      case TestChangeQuestionStateEvent:
        final old = _test.canMoveForward;
        _test.checkCanMoveForward();
        if (_test.canMoveForward != old) {
          yield wrapper;
        }
        break;

      default:
        throw UnimplementedError();
    }
  }
}
