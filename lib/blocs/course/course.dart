import 'package:bloc/bloc.dart';
import 'package:mavka/blocs/course/events.dart';
import 'package:mavka/blocs/course/states.dart';
import 'package:mavka/models/course.dart';
import 'package:mavka/services/courses_api.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  @override
  CourseState get initialState => CourseNullState();

  // todo store data in hive
  final _api = CoursesApi();
  List<Course> courses;

  List<Course> getCoursesByForm(int form) =>
      courses.where((element) => element.form == form).toList();

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    switch (event.runtimeType) {
      case LoadCourseDatabaseEvent:
        courses = await _api.getAllCourses();
        yield CourseLoadedState();
        break;

      default:
        throw UnimplementedError();
    }
  }
}
