import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/screens/getting_started/1_data.dart';
import 'package:mavka/screens/getting_started/2_type.dart';
import 'package:mavka/utilities/cast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '3_form.dart';
import '4_dream.dart';
import '5_courses.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  final _pageController = PageController();
  int page = 0;

  final List<GSModel> models = [
    StepDataGSModel(),
    StepTypeGSModel(),
    StepFormGSModel(),
    StepDreamGSModel(),
    StepCoursesGSModel(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void resetKeyboard() => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    print(page);
    print('page was changed');

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 26,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SmoothPageIndicator(
                    count: 5,
                    effect: SlideEffect(
                        radius: 0,
                        spacing: 0,
                        dotWidth: 64,
                        dotHeight: 8,
                        dotColor: Colors.blue[200],
                        activeDotColor: Colors.blue[300]),
                    controller: _pageController,
                  ),
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: StepDataGS(cast<StepDataGSModel>(models[0]))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: StepTypeGS(cast<StepTypeGSModel>(models[1])),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: StepFormGS(cast<StepFormGSModel>(models[2])),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: StepDreamGS(cast<StepDreamGSModel>(models[3])),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: StepCoursesGS(cast<StepCoursesGSModel>(models[4])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    if (page != 0)
                      Expanded(
                        child: OutlineButtonComponent(
                          text: 'Назад',
                          onPressed: () {
                            resetKeyboard();
                            _pageController.animateToPage(page - 1,
                                curve: Curves.easeInOutCubic,
                                duration: const Duration(milliseconds: 300));

                            setState(() {
                              page--;
                              //todo come up with a solution that doesn't relies on time
                              Future.delayed(const Duration(milliseconds: 100),
                                  () => models[page].checkData());
                            });

//                            CoursesApi()..getAllCourses();
                          },
                        ),
                      ),
                    if (page != 0)
                      const SizedBox(
                        width: 8,
                      ),
                    Expanded(
                      child: StreamBuilder<bool>(
                          stream: models[page].isNextActive.stream,
                          initialData: false,
                          builder: (context, snapshot) {
                            return FlatButtonComponent(
                              text: (page == 4 && !snapshot.data)
                                  ? 'Пропустити'
                                  : 'Продовжити',
                              onPressed: (snapshot.data || page == 4)
                                  ? () {
                                      //todo declare case earlier

                                      if (page == 2) {
                                        cast<StepCoursesGSModel>(models[4])
                                                .form =
                                            cast<StepFormGSModel>(models[2])
                                                .form;
                                      }

                                      if (page == 4) {
                                        // todo
                                        print('DONE!');
                                        print('first name last name: ' +
                                            cast<StepDataGSModel>(models[0])
                                                .firstName +
                                            ' ' +
                                            cast<StepDataGSModel>(models[0])
                                                .lastName);
                                        print('user type: ' +
                                            cast<StepTypeGSModel>(models[1])
                                                .userType
                                                .toString());
                                        print('form: ' +
                                            cast<StepFormGSModel>(models[2])
                                                .form
                                                .toString());
                                        print('dream id: ' +
                                            cast<StepDreamGSModel>(models[3])
                                                .dream
                                                .toString());
                                        print('courses: ' +
                                            cast<StepCoursesGSModel>(models[4])
                                                .courses
                                                .toString());
                                      } else {
                                        resetKeyboard();
                                        //todo as a component
                                        _pageController.animateToPage(page + 1,
                                            curve: Curves.easeInOutCubic,
                                            duration: const Duration(
                                                milliseconds: 300));

                                        setState(() {
                                          page++;
                                          Future.delayed(
                                              const Duration(milliseconds: 100),
                                              () => models[page].checkData());
                                        });
                                      }
                                    }
                                  : null,
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class GSModel {
  StreamController<bool> isNextActive = StreamController<bool>.broadcast();

  void checkData();
}
