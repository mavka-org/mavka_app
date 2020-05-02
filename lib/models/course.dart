import 'package:flutter/material.dart';


class Course{

  String _uid;
  String _name;
  String _form;
  String _info;
  //AssetImage _image;

  Course(String uid, String name, String form, String info, /*AssetImage image*/){
    _uid = uid;
    _name = name;
    _form = form;
    _info = info;
    //_image = image;
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

  String getForm() {
    return _form;
  }
  void setForm(String form) {
    _form = form;
  }

  String getInfo() {
    return _info;
  }
  void setType(String info) {
    _info = info;
  }

  /*AssetImage getImage() {
    return _image;
  }
  void setImage(AssetImage image) {
    _image = image;
  }*/

}

 Widget courseTemplate(course, width){
      return Container(
        margin: EdgeInsets.fromLTRB(4, 14, 4, 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.brown[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image(
                  image: NetworkImage(course.url),
                  width: width,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: width * 0.7,
                  height: 10,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green,),
                    value: course.progress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  course.text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }