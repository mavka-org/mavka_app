import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/userInfo.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference users = Firestore.instance.collection('users');

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


}