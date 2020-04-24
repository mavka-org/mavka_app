class Unit{

  String _uid;
  String _name;
  int  _number;
  String _info;


  Unit(String uid, String name, int number, String info){
    _uid = uid;
    _name = name;
    _number = number;
    _info = info;
  }

  String getId() {
    return _uid;
  }
  void setId(String uid) {
    _uid = uid;
  }

  String getName() {
    return _name;
  }
  void setName(String name) {
    _name = name;
  }

  int getForm() {
    return _number;
  }
  void setForm(int number) {
    _number = number;
  }

  String getInfo() {
    return _info;
  }
  void setType(String info) {
    _info = info;
  }


}