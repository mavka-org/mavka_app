import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/course.dart';
import 'package:mavka/models/topic.dart';
import 'package:mavka/models/unit.dart';
import 'package:mavka/models/userInfo.dart';

class DatabaseService{

  final String uid;
  DatabaseService(this.uid);

  static CollectionReference users = Firestore.instance.collection('users');
  static CollectionReference students = Firestore.instance.collection('students');
  static CollectionReference courses = Firestore.instance.collection('courses');


  Future<bool> isInBase() async{
    DocumentSnapshot ds = await users.document(uid).get();
    print(ds.exists);
    return ds.exists;
  }

  Future updateUserData(User user) async {
    return await users.document(uid).setData({
      'firstName': user.getFirstName(),
      'secondName': user.getSecondName(),
      'type': user.getType(),
      'connectionId': user.getConId()
    });
  }

  Future<User> getUserInfo(String uid) async {
    DocumentSnapshot ds = await users.document(uid).get();
    return User(
      ds.data['firstName'],
      ds.data['secondName'],
      ds.data['type'],
    );
  }


  Future<List<Unit>> getAllUnitsWithName (String course) async {
    // print("start of query");
    var units = await courses.where("Name", isEqualTo: course).getDocuments();
    var list = units.documents;
    // print("end of query");
    List<Unit> result = new List();
    list.forEach((element) {
      result.add(Unit(element.documentID, element.data['Name'], element.data['Form'], element.data['Info']));
    });
    return result;
  }

  Future<List<Unit>> getAllUnitsWithId (String id) async {
    //print("start of query");
    var units = await courses.document(id).get();
    // print("end of query");
    var unit = await units.reference.collection("units").getDocuments();
    var list = unit.documents;
    List<Unit> result = new List();
    list.forEach((element) {
      result.add(Unit(element.documentID, element.data['Name'], element.data['Form'], element.data['Info']));
    });
    return result;
  }
  Future<List<Unit>> getAllUnitsWithIdAndForm (String id, int form) async {
    //print("start of query");
    var units = await courses.document(id).get();
    // print("end of query");
    var unit = await units.reference.collection("units").where("Form", isEqualTo: form).getDocuments();
    var list = unit.documents;
    List<Unit> result = new List();
    list.forEach((element) {
      result.add(Unit(element.documentID, element.data['Name'], element.data['Form'], element.data['Info']));
    });
    return result;
  }

  Future<List<Topic>> getAllTopicsWithName (String course, String unitName) async { //правильная функция!!!!!!!
    // print("Caaaaaaaall");
    List<Topic> result = List();
    var cc = await courses.where("Name", isEqualTo: course).getDocuments();
    var c = cc.documents;
    var units = await c[0].reference.collection("units").getDocuments();
    var unit = units.documents;
    for (var v in unit) {
      if (v.data['Name'] == unitName) {
        var k = await v.reference.collection("topics").getDocuments();
        var topics = k.documents;
        topics.forEach((element) {
          result.add(Topic(element.documentID, element.data['Name'], element.data['Number'], element.data['Info']));
        });
      }
    }
    return result;
  }
  Future<List<Topic>> getAllTopicsWithNameAndForm (String course, String unitName, int form) async { //правильная функция!!!!!!!
    // print("Caaaaaaaall");
    List<Topic> result = List();
    var cc = await courses.where("Name", isEqualTo: course).where("Form", isEqualTo: form).getDocuments();
    var c = cc.documents;
    var units = await c[0].reference.collection("units").getDocuments();
    var unit = units.documents;
    for (var v in unit) {
      if (v.data['Name'] == unitName) {
        var k = await v.reference.collection("topics").getDocuments();
        var topics = k.documents;
        topics.forEach((element) {
          result.add(Topic(element.documentID, element.data['Name'], element.data['Number'], element.data['Info']));
        });
      }
    }
    return result;
  }

  Future<List<DocumentSnapshot>> getAllCourses () async {
    var c = await courses.getDocuments();
    var list = c.documents;
    return list;
  }

  Future<List<DocumentSnapshot>> getAllCoursesByForm (int form) async {
    var c = await courses.where("Form", isEqualTo: form).getDocuments();
    var list = c.documents;
    return list;
  }


  Future addCourseToStudent(String studentID, String courseID) async{
    DocumentSnapshot dsStudent = await students.document(studentID).get();
    DocumentSnapshot dsCourse = await courses.document(courseID).get();
    List<dynamic> dr = dsStudent.data['Courses'];
    dr.add({'CourseReference': dsCourse.reference});
    return await dsStudent.reference.setData({
      'Courses': dr
    }, merge: true);
  }


  Future<List<Course>> getCoursesByForm(int myForm) async{
    var docs = await courses.where('Form', isEqualTo: myForm).getDocuments();
    List<DocumentSnapshot> ds = docs.documents;
    List<Course> result = new List();
    ds.forEach((element) {
      result.add(Course(element.documentID, element.data['Name'], element.data['Form'], element.data['Info']));
    });
    return result;
  }

  static Future<String> getNextConnectionId() async {
    var doc = await students.document('LastID').get();
    String ID = doc.data['ID'];
    print('ID');
    ID = nextID(ID);
    await students.document('LastID').setData({'ID': ID});
    return ID;
  }

  static String nextID(String ID) {
    for(int i = 5; i >= 2; --i) {
      if(ID[i] != '9') {
        String tmp = String.fromCharCode(ID.codeUnitAt(i) + 1);
        String res = ID.substring(0, i) + tmp;
        if(i + 1 < 6) {
          res += ID.substring(i + 1, 5 - i);
        }
        return res;
      }
    }
    for(int i = 1; i >= 0; --i) {
      if(ID[i] != 'Z') {
        String tmp = String.fromCharCode(ID.codeUnitAt(i) + 1);
        String res = tmp + ID.substring(i + 1, 5 - i);
        if(i != 0) {
          res = ID.substring(0, i) + res;
        }
        return res;
      }
    }
    return 'PIZDA';
  }

}