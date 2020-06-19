import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/test/events.dart';
import 'package:mavka/blocs/test/test.dart';
import 'package:mavka/components/animations.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/components/page_indicators.dart';
import 'package:mavka/components/painters.dart';
import 'package:mavka/layouts/authorized/page.dart';
import 'package:mavka/model_views/question.dart';
import 'package:mavka/model_views/question_card.dart';
import 'package:mavka/models/test/question.dart';
import 'package:mavka/models/test/test.dart';
import 'package:mavka/utilities/wrapper.dart';
import 'package:mavka/utilities/zeroed.dart';

class TestPage extends StatefulWidget {
//   todo inspect border radius for layouts & navbar
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isPagesViewMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TestBloc()..add(TestStartEvent()),
        child: BlocBuilder<TestBloc, Wrapper<Test>>(
          condition: (a1, a2) => true,
          builder: (BuildContext context, Wrapper<Test> container) {
            final state = container.obj;
            if (state.questions == null) return Container();

            // todo ask on exit
            return PageLayout(
                color: Colors.indigo[300],
                hero: 'card0',
                belowHeader: ExpandedSection(
                  expand: isPagesViewMode,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 320,
                    // todo convert every ListView to ListView.builder for better performance
                    child: ListView.builder(
                      itemCount: state.questions.length,
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      itemBuilder: (BuildContext context, int index) {
                        final e = state.questions[index % 3];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: QuestionCardView(
                              e,
                              getZeroed(index + 1, state.questions.length),
                              (state.isExam && e.state != QuestionState.filled)
                                  ? null
                                  : () {}),
                        );
                      },
                    ),
                  ),
                ),
                customHeader: TestPageIndicatorComponent(state.questions,
                    () => setState(() => isPagesViewMode = !isPagesViewMode)),
                customHeaderEnd: state.isDuration
                    ? Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: StreamBuilder<Duration>(
                            stream: state.timerStream.stream,
                            builder: (context, snapshot) {
                              if (snapshot.data == null) return Container();

                              final mins = snapshot.data.inMinutes;

                              var secs = (snapshot.data.inSeconds - mins * 60)
                                  .toString();
                              if (secs.length == 1) secs = '0$secs';

                              return Text(
                                '$mins\n$secs',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              );
                            }),
                      )
                    : Container(),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: isPagesViewMode ? 0.4 : 1,
                      child: Column(
                        children: [
                          if (state.page == -1) Expanded(child: intro(state)),
                          if (state.page > -1 &&
                              state.page < state.questions.length)
                            Expanded(
                              child: QuestionView(state.questions[state.page]),
                            ),
                          bottom(state, context),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                    if (isPagesViewMode)
                      Positioned.fill(
                          child: CustomPaint(
                        painter: StripperPainter(),
                      )),
                    if (isPagesViewMode)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Center(
                          child: FlatButtonComponent(
                            onPressed: () => setState(
                                () => isPagesViewMode = !isPagesViewMode),
                            text: 'Повернутися до завдання',
                          ),
                        ),
                      )
                  ],
                ));
          },
        ));
  }

  Widget bottom(Test state, BuildContext context) {
    final bloc = context.bloc<TestBloc>();

    if (state.page == -1) {
      return FlatButtonComponent(
        onPressed: () => bloc.add(TestNextPageEvent()),
        text: 'Почати',
      );
    } else if (state.page == state.questions.length) {
      return FlatButtonComponent(
        onPressed: () => Navigator.of(context).pop(),
        text: 'Закінчити',
      );
    } else {
      return Row(
        children: [
          Expanded(
              child: OutlineButtonComponent(
            onPressed: () => bloc.add(TestPrevPageEvent()),
            text: 'Назад',
          )),
          const SizedBox(
            width: 18,
          ),
          Expanded(
              child: FlatButtonComponent(
            onPressed: !state.canMoveForward
                ? null
                : () => bloc.add(TestNextPageEvent()),
            text: state.isExam ? 'Продовжити' : 'Перевірити',
          )),
        ],
      );
    }
  }

  Widget intro(Test test) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              test.name,
              style: GoogleFonts.montserratAlternates(
                  fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            test.description,
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
          const SizedBox(
            height: 28,
          )
        ],
      );
}
