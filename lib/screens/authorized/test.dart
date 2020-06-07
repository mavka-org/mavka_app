import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/blocs/test/events.dart';
import 'package:mavka/blocs/test/states.dart';
import 'package:mavka/blocs/test/test.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/components/page_indicators.dart';
import 'package:mavka/layouts/authorized/page.dart';
import 'package:mavka/model_views/question_types/question.dart';
import 'package:mavka/models/test/test.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TestBloc()..add(TestStartEvent()),
        child: BlocBuilder<TestBloc, TestState>(
          builder: (BuildContext context, state) {
            if (state is TestNullState) return Container();
            // todo ugh
            print('main rebuild');
            final bloc = context.bloc<TestBloc>();
            return PageLayout(
                color: Colors.indigo[300],
                customHeader:
                    TestPageIndicatorComponent(bloc.currentTest.questions),
                child: Column(
                  children: [
                    if (bloc.currentTest.page == -1) intro(bloc.currentTest),
                    if (bloc.currentTest.page > -1 &&
                        bloc.currentTest.page <
                            bloc.currentTest.questions.length)
                      QuestionView(
                          bloc.currentTest.questions[bloc.currentTest.page]),
                    const Spacer(),
                    bottom(bloc, context),
                    const SizedBox(
                      height: 28,
                    ),

//                    RaisedButton(
//                      onPressed: () => bloc.add(TestNextPageEvent()),
//                      child: const Text('next'),
//                    ),
//                    RaisedButton(
//                      onPressed: () => bloc.add(TestPrevPageEvent()),
//                      child: const Text('prev'),
//                    )
                  ],
                ));
          },
        ));
  }

  Widget bottom(TestBloc bloc, BuildContext context) {
    if (bloc.currentTest.page == -1) {
      return FlatButtonComponent(
        onPressed: () => bloc.add(TestNextPageEvent()),
        text: 'Почати',
      );
    } else if (bloc.currentTest.page == bloc.currentTest.questions.length) {
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
            onPressed: () => bloc.add(TestNextPageEvent()),
            text: 'Продовжити',
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
