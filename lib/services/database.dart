import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future updateUserData(String firstName, String secondName, String userType) async {
    return await users.document(uid).setData({
      'firstName': firstName,
      'secondName': secondName,
      'type': userType
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

  Future addCourseToStudent(String studentID, String courseID) async{
    DocumentSnapshot dsStudent = await students.document(studentID).get();
    DocumentSnapshot dsCourse = await courses.document(courseID).get();
    List<dynamic> dr = dsStudent.data['Courses'];
    dr.add({'CourseReference': dsCourse.reference});
    return await dsStudent.reference.setData({
      'Courses': dr
    }, merge: true);
  }

  Future<List<DocumentSnapshot>> getCoursesByForm(int myForm) async{
    var docs = await courses.where('Form', isEqualTo: myForm).getDocuments();
    List<DocumentSnapshot> result = docs.documents;
    return result;
  }
  

}