import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mavka/models/brew.dart';
import 'package:mavka/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection = Firestore.instance.collection('flutter');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  Stream<List<Brew>> get changes{
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(uid: uid, name: snapshot.data['name'], sugars: snapshot.data['sugars'], strength: snapshot.data['strength']);
  }

}