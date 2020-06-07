import 'package:bloc/bloc.dart';
import 'package:mavka/blocs/test/events.dart';
import 'package:mavka/blocs/test/states.dart';
import 'package:mavka/models/test/question.dart';
import 'package:mavka/models/test/question_types/question_type.dart';
import 'package:mavka/models/test/test.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  @override
  TestState get initialState => TestNullState();

  // todo dunno, probably shouldn't store data like that, needs review
  Test currentTest;

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    switch (event.runtimeType) {
      case TestStartEvent:
        currentTest = Test()
          ..name = 'Test title'
          ..description = 'test description'
          ..questions = [
            Question()
              ..text = 'question #1 text'
              ..question = (GeneralABCDQuestionType()
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
                ]),
            Question()
              ..text =
                  r'question #2 text here: $$\frac{1}{2}! \neq \frac{1}{2}$$'
              ..question = (GeneralMatchingQuestionType()
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
                ]),
          ];

        yield TestRunningState();
        break;

      case TestNextPageEvent:
        currentTest.nextPage();
        yield TestRunningState();
        break;

      case TestPrevPageEvent:
        currentTest.prevPage();
        yield TestRunningState();
        break;

      default:
        throw UnimplementedError();
    }
  }
}
