import 'package:hive/hive.dart';
import 'package:mavka/utilities/cast.dart';

part 'course.g.dart';

@HiveType(typeId: 1)
class Course {
  @HiveField(0)
  int form;

  @HiveField(1)
  String info;

  @HiveField(2)
  String name;

  Course();

  Course.fromMap(Map<String, dynamic> map)
      : form = cast<int>(map['Form']),
        info = cast<String>(map['Info']),
        name = cast<String>(map['Name']);

  @override
  String toString() => '<Course> $name for $form ($info)';
}
