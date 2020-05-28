import 'package:mavka/utilities/cast.dart';

class Course {
  int form;
  String info;
  String name;

  Course.fromMap(Map<String, dynamic> map)
      : form = cast<int>(map['Form']),
        info = cast<String>(map['Info']),
        name = cast<String>(map['Name']);

  @override
  String toString() => '<Course> $name for $form ($info)';
}
