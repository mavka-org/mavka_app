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
