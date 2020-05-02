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
        List<Topic> fin = new List();
        result.forEach((element) {
          fin.add(Topic(element.documentID, element.data['Name'], element.data['Number'], element.data['Info']));
        });
        return fin;
      }
    }
    return null;
  }

  Future<List<DocumentSnapshot>> getAllCourses () async {
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