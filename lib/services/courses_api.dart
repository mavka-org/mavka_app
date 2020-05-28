import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/course.dart';

class CoursesApi {
  final CollectionReference store = Firestore.instance.collection('courses');

  Future<List<Course>> getAllCoursesForForm(int form) async {
    final data = await store.where('Form', isEqualTo: form).getDocuments();

    return data.documents
        .map((e) => Course.fromMap(e.data))
        .toList()
        .cast<Course>();
  }
}
