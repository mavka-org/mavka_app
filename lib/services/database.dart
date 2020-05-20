import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/course.dart';
import 'package:mavka/models/topic.dart';
import 'package:mavka/models/unit.dart';
import 'package:mavka/models/user_info.dart';
import 'package:mavka/models/user_types.dart';
import 'package:mavka/utilities/cast.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  static CollectionReference users = Firestore.instance.collection('users');
  static CollectionReference students =
      Firestore.instance.collection('students');
  static CollectionReference courses = Firestore.instance.collection('courses');

  Future<bool> isInBase() async {
    final ds = await users.document(uid).get();
    print(ds.exists);
    return ds.exists;
  }

  Future updateUserData(User user) {
    return users.document(uid).setData({
      'firstName': user.firstName,
      'secondName': user.secondName,
      'type': userType2string(user.type),
      'connectionId': user.conId
    });
  }

  Future<User> getUserInfo(String uid) async {
    final ds = await users.document(uid).get();

    return User(
        firstName: ds.data['firstName'].toString(),
        secondName: ds.data['secondName'].toString(),
        type: string2userType(ds.data['type'].toString()));
  }

  Future<List<Unit>> getAllUnitsWithName(String course) async {
    // print("start of query");
    final units = await courses.where('Name', isEqualTo: course).getDocuments();
    final list = units.documents;
    // print("end of query");
    final result = <Unit>[];
    for (final element in list) {
      result.add(Unit(
          uid: element.documentID,
          name: element.data['Name'].toString(),
          number: cast<int>(element.data['Form']),
          info: element.data['Info'].toString()));
    }
    return result;
  }

  Future<List<Unit>> getAllUnitsWithId(String id) async {
    //print("start of query");
    final units = await courses.document(id).get();
    // print("end of query");
    final unit = await units.reference.collection('units').getDocuments();
    final list = unit.documents;
    final result = <Unit>[];
    for (final element in list) {
      result.add(Unit(
          uid: element.documentID,
          name: cast<String>(element.data['Name']),
          number: cast<int>(element.data['Form']),
          info: cast<String>(element.data['Info'])));
    }
    return result;
  }

  Future<List<Unit>> getAllUnitsWithIdAndForm(String id, int form) async {
    //print("start of query");
    final units = await courses.document(id).get();
    // print("end of query");
    final unit = await units.reference
        .collection('units')
        .where('Form', isEqualTo: form)
        .getDocuments();
    final list = unit.documents;
    final result = <Unit>[];
    for (final element in list) {
      result.add(Unit(
          uid: element.documentID,
          name: cast<String>(element.data['Name']),
          number: cast<int>(element.data['Form']),
          info: cast<String>(element.data['Info'])));
    }

    return result;
  }

  Future<List<Topic>> getAllTopicsWithName(
      String course, String unitName) async {
    //правильная функция!!!!!!!
    // print("Caaaaaaaall");
    final result = <Topic>[];
    final cc = await courses.where('Name', isEqualTo: course).getDocuments();
    final c = cc.documents;
    final units = await c[0].reference.collection('units').getDocuments();
    final unit = units.documents;
    for (final v in unit) {
      if (v.data['Name'] == unitName) {
        final k = await v.reference.collection('topics').getDocuments();
        final topics = k.documents;
        for (final element in topics) {
          result.add(Topic(
              uid: element.documentID,
              name: cast<String>(element.data['Name']),
              number: cast<int>(element.data['Number']),
              info: cast<String>(element.data['Info'])));
        }
      }
    }
    return result;
  }

  Future<List<Topic>> getAllTopicsWithNameAndForm(
      String course, String unitName, int form) async {
    //правильная функция!!!!!!!
    // print("Caaaaaaaall");
    final result = <Topic>[];
    final cc = await courses
        .where('Name', isEqualTo: course)
        .where('Form', isEqualTo: form)
        .getDocuments();
    final c = cc.documents;
    final units = await c[0].reference.collection('units').getDocuments();
    final unit = units.documents;
    for (final v in unit) {
      if (v.data['Name'] == unitName) {
        final k = await v.reference.collection('topics').getDocuments();
        final topics = k.documents;
        for (final element in topics) {
          result.add(Topic(
              uid: element.documentID,
              name: cast<String>(element.data['Name']),
              number: cast<int>(element.data['Number']),
              info: cast<String>(element.data['Info'])));
        }
      }
    }
    return result;
  }

  Future<List<DocumentSnapshot>> getAllCourses() async {
    final c = await courses.getDocuments();
    final list = c.documents;
    return list;
  }

  Future<List<DocumentSnapshot>> getAllCoursesByForm(int form) async {
    final c = await courses.where('Form', isEqualTo: form).getDocuments();
    final list = c.documents;
    return list;
  }

  Future addCourseToStudent(String studentID, String courseID) async {
    final dsStudent = await students.document(studentID).get();
    final dsCourse = await courses.document(courseID).get();
    final dr = dsStudent.data['Courses'];
    dr.add({'CourseReference': dsCourse.reference});
    return dsStudent.reference.setData({'Courses': dr}, merge: true);
  }

  Future<List<Course>> getCoursesByForm(int myForm) async {
    final docs = await courses.where('Form', isEqualTo: myForm).getDocuments();
    final ds = docs.documents;
    final result = <Course>[];
    for (final element in ds) {
      result.add(Course(
          uid: element.documentID,
          name: cast<String>(element.data['Name']),
          form: cast<String>(element.data['Form']),
          info: cast<String>(element.data['Info'])));
    }
    return result;
  }

  static Future<String> getNextConnectionId() async {
    final doc = await students.document('LastID').get();
    var id = cast<String>(doc.data['ID']);
    print('ID');
    id = nextID(id);
    await students.document('LastID').setData({'ID': id});
    return id;
  }

  static String nextID(String id) {
    for (var i = 5; i >= 2; --i) {
      if (id[i] != '9') {
        final tmp = String.fromCharCode(id.codeUnitAt(i) + 1);
        var res = id.substring(0, i) + tmp;
        if (i + 1 < 6) {
          res += id.substring(i + 1, 5 - i);
        }
        return res;
      }
    }
    for (var i = 1; i >= 0; --i) {
      if (id[i] != 'Z') {
        final tmp = String.fromCharCode(id.codeUnitAt(i) + 1);
        var res = tmp + id.substring(i + 1, 5 - i);
        if (i != 0) {
          res = id.substring(0, i) + res;
        }
        return res;
      }
    }
    return 'PIZDA';
  }
}
