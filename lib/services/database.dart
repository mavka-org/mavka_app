import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference myBase = Firestore.instance.collection('users');

  Future<bool> isInBase() async{
    DocumentSnapshot ds = await myBase.document(uid).get();
    print(ds.exists);
    return ds.exists;
  }

  Future updateUserData(String userType, String firstName, String secondName) async {
    return await myBase.document(uid).setData({
      'userType': userType,
      'firstName': firstName,
      'secondName': secondName
    });
  }

}