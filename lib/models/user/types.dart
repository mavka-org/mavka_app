//class UserType<String> extends Enum<String> {
//  const UserType(String val) : super(val);
//
//  static const UserType student = UserType('student');
//  static const UserType teacher = UserType('teacher');
//  static const UserType parent = UserType('parent');
//}

enum UserType { student, teacher, parent }

String userType2string(UserType type) {
  switch (type) {
    case UserType.student:
      return 'student';
      break;
    case UserType.teacher:
      return 'teacher';
      break;
    case UserType.parent:
      return 'parent';
      break;
    default:
      throw UnimplementedError('type does not exist');
  }
}

UserType string2userType(String type) {
  switch (type) {
    case 'student':
      return UserType.student;
      break;
    case 'teacher':
      return UserType.teacher;
      break;
    case 'parent':
      return UserType.parent;
      break;
    default:
      throw UnimplementedError('type does not exist');
  }
}

String userType2localizedString(UserType type) {
  switch (type) {
    case UserType.student:
      return 'Учень';
      break;
    case UserType.teacher:
      return 'Вчитель';
      break;
    case UserType.parent:
      return 'Батьки';
      break;
    default:
      throw UnimplementedError('type does not exist');
  }
}
