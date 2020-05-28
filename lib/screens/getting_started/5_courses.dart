import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/models/course.dart';
import 'package:mavka/screens/getting_started/getting_started.dart';
import 'package:mavka/services/courses_api.dart';

class StepCoursesGS extends StatelessWidget {
  final StepCoursesGSModel model;

  const StepCoursesGS(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Обери курси з яких ти хотів би почати',
          style:
              GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 32,
        ),

        //todo icons for courses
        //todo null array when form was changed
        //todo as a bloc or something
        StreamBuilder<bool>(
            stream: model.isNextActive.stream,
            builder: (context, snapshot) {
              return FutureBuilder(
//                  key: UniqueKey(),
                  future: CoursesApi().getAllCoursesForForm(model.form),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Course>> snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('Загрузка...');
                    } else {
                      model.courses
                          .removeWhere((element) => element.form != model.form);

                      return Column(
                        children: snapshot.data
                            .map((e) => CheckButtonComponent(
                                  text: e.name ?? '123',
                                  fontSize: 20,
                                  checked: model.courses
                                      .where(
                                          (element) => element.name == e.name)
                                      .isNotEmpty,
                                  radio: false,
                                  onPressed: () {
                                    print(model.form);
                                    print('fff');
                                    if (model.courses
                                        .where(
                                            (element) => element.name == e.name)
                                        .isEmpty) {
                                      model.courses.add(e);
                                      model.checkData();
                                    } else {
                                      model.courses.removeWhere(
                                          (element) => element.name == e.name);
                                      model.checkData();
                                    }
                                  },
//                                  svg: SvgPicture.asset(
//                                    'assets/courses/math.svg',
//                                    height: 24,
//                                    color: Colors.white,
//                                  ),
                                ))
                            .toList(),
                      );
                    }
                  });
            }),

//        CheckButtonComponent(
//          text: 'Українська мова',
//          fontSize: 20,
//          checked: false,
//          onPressed: () {},
//          svg: SvgPicture.asset(
//            'assets/courses/notebook.svg',
//            height: 24,
//            color: Colors.white,
//          ),
//        ),
      ],
    );
  }
}

class StepCoursesGSModel extends GSModel {
  List<Course> courses = [];

  //todo form as a model
  int form;

  @override
  void checkData() {
    isNextActive.add(courses != null && courses.isNotEmpty);
  }
}
