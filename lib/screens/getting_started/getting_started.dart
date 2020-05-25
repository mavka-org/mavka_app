import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/screens/getting_started/1_data.dart';
import 'package:mavka/screens/getting_started/2_type.dart';
import 'package:mavka/utilities/cast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  final _pageController = PageController();
  int page = 0;

  final List<GSModel> models = [StepDataGSModel(), StepTypeGSModel()];

  @override
  void initState() {
//    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(page);
    print('page was changed');

    return Scaffold(
      body: SafeArea(
        child: Builder(
//          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),

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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    if (page != 0)
                      Expanded(
                        child: ButtonTheme(
                          height: 40,
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {
                              _pageController.animateToPage(page - 1,
                                  curve: Curves.easeInOutCubic,
                                  duration: const Duration(milliseconds: 300));

                              setState(() {
                                page--;
                                //todo come up with a solution that doesn't relies on time
                                Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () => models[page].checkData());
                              });
                            },
                            child: Text(
                              'Назад',
                              style: GoogleFonts.montserratAlternates(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    if (page != 0)
                      const SizedBox(
                        width: 8,
                      ),
                    Expanded(
                        child: ButtonTheme(
                      height: 40,
                      minWidth: double.infinity,
                      child: StreamBuilder<bool>(
                          stream: models[page].isNextActive.stream,
                          initialData: false,
                          builder: (context, snapshot) {
//                            models[page].checkData();

                            return FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: Colors.blue,
                              disabledColor: Colors.blueGrey,
                              onPressed: snapshot.data
                                  ? () {
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
                                  : null,
                              child: Text(
                                'Продовжити',
                                style: GoogleFonts.montserratAlternates(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            );
                          }),
                    )),
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
