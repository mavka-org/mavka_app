import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/course.dart';
import 'package:mavka/models/topic.dart';
import 'package:mavka/models/unit.dart';
import 'package:mavka/models/userInfo.dart';

class DatabaseService{

  final String uid;
  DatabaseService(this.uid);

  final CollectionReference users = Firestore.instance.collection('users');
  final CollectionReference students = Firestore.instance.collection('students');
  final CollectionReference courses = Firestore.instance.collection('courses');

  static final CollectionReference courses = Firestore.instance.collection('courses');

  Future<bool> isInBase() async{
    DocumentSnapshot ds = await users.document(uid).get();
    print(ds.exists);
    return ds.exists;
  }

  Future updateUserData(User user) async {
    return await users.document(uid).setData({
      'firstName': user.getFirstName(),
      'secondName': user.getSecondName(),
      'type': user.getType()
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
  /*static Future getAllCourses () async {
    print("start of list");
    var m = await courses.getDocuments();
    var k = m.documents;
    for (var v in k) {
      print("start course");
      v.data.forEach((key, value) {
        print(key);
        print(value);
      });
      print(v.documentID);
      var unit = await v.reference.collection("units").getDocuments();
     // print(unit);
      var t = unit.documents;
     // print(t);
      t.forEach((element) {
        print("Element");
        print(element.data);
        print(element.documentID);
        print("ENDDDDD");
      });
      print("end course");
    }

    /*var m = await Firestore.instance
        .collection('courses')
        .document('test')
        .get();
    for (var v in m.data.keys) {
      print(v);
    }*/
    print("end of list");
  }*/
  static Future getAllUnitsWithName (String course) async {
   // print("start of query");
    var units = await courses.where("Name", isEqualTo: course).getDocuments();
    var list = units.documents;
   // print("end of query");
    for (var v in list) {
      var k = await v.reference.collection("units").getDocuments();
      var result = k.documents;
      return result;
    }
    return null;
  }
  static Future<List<DocumentSnapshot>> getAllUnitsWithId (String id) async {
    //print("start of query");
    var units = await courses.document(id).get();
   // print("end of query");
    var unit = await units.reference.collection("units").getDocuments();
    var result = unit.documents;
    return result;
  }


  Future<List<Unit>> getAllUnitsWithName (String course) async {
    // print("start of query");
    var units = await courses.where("Name", isEqualTo: course).getDocuments();
    var list = units.documents;
    // print("end of query");
    List<Unit> result = new List();
    list.forEach((element) {
      result.add(Unit(element.documentID, element.data['Name'], element.data['Number'], element.data['Info']));
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
      result.add(Unit(element.documentID, element.data['Name'], element.data['Number'], element.data['Info']));
    });
    return result;
  }

  Future<List<Topic>> getAllTopicsWithName (String course, String unitName) async {
    var collectionUnits = await courses.where("Name", isEqualTo: course).getDocuments();
    var units = collectionUnits.documents;
    for (var unit in units) {
      var data = unit.data;
      if (data['Name'] == unitName) {
        var themes = await unit.reference.collection("topics").getDocuments();
        var result = themes.documents;
        /*for (var v in result) {
              print(v.data);
         }*/
        return result;
      }
    }
    return null;
  }

  static Future<List<DocumentSnapshot>> getAllCourses () async {
    var c = await courses.getDocuments();
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

}