import 'dart:core';

import 'package:mavka/utilities/enum.dart';

class UserType extends Enum<String> {
  const UserType(String val) : super(val);

  static const UserType student = UserType('student');
  static const UserType teacher = UserType('teacher');
  static const UserType parent = UserType('parent');

  String get getLocalizedString {
    final type = super.toString();

    switch (type) {
      case 'student':
        return 'Учень';
      case 'teacher':
        return 'Вчитель';
      case 'parent':
        return 'Батьки';
    }

    throw UnimplementedError(type);
  }
}
