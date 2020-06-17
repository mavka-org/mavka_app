abstract class TestEvent {}

class TestStartEvent extends TestEvent {
  // todo pass test id or something
}

class TestNextPageEvent extends TestEvent {}

class TestPrevPageEvent extends TestEvent {}

class TestChangeQuestionStateEvent extends TestEvent {}
