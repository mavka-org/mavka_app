import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:mavka/blocs/course/events.dart';
import 'package:mavka/blocs/course/states.dart';
import 'package:mavka/models/course.dart';
import 'package:mavka/services/courses_api.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  @override
  CourseState get initialState => CourseNullState();

  // todo load data from storage (if network error occurs)
  final _api = CoursesApi();
  List<Course> courses;
  final Box _storage = Hive.box<Course>('courses');

  CourseBloc() : assert(Hive.isBoxOpen('courses'));

  List<Course> getCoursesByForm(int form) =>
      courses.where((element) => element.form == form).toList();

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    switch (event.runtimeType) {
      case LoadCourseDatabaseEvent:
        courses = await _api.getAllCourses();
        await _storage.clear();
        _storage.addAll(courses);
        yield CourseLoadedState();
        break;

      default:
        throw UnimplementedError();
    }
  }
}
