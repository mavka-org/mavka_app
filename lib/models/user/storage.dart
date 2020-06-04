import 'package:mavka/models/user/types.dart';
import 'package:mavka/utilities/cast.dart';
import 'package:meta/meta.dart';

class UserStorage {
  final String firstName;
  final String secondName;

//  final String connectionId;
  final UserType type;

  // todo connection id
  UserStorage(
      {@required this.firstName,
      @required this.secondName,
//      @required this.connectionId,
      @required this.type});

  UserStorage.fromMap(Map<String, dynamic> map)
      : firstName = cast<String>(map['firstName']),
        secondName = cast<String>(map['secondName']),
//        connectionId = cast<String>(map['connectionId']),
        type = UserType(cast<String>(map['type']));

  Map<String, dynamic> get toMap => {
        'firstName': firstName,
        'secondName': secondName,
//        'connectionId': connectionId,
        'type': type.toString()
      };
}
