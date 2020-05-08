import 'package:flutter/material.dart';
import 'package:mavka/models/userInfo.dart';
import 'package:mavka/screens/authenticate/onboarding_screen/motivation_page.dart';
import 'package:mavka/services/database.dart';
import 'package:mavka/shared/loading.dart';

class ClassAndCodePage extends StatefulWidget {
  @override
  _ClassAndCodePageState createState() => _ClassAndCodePageState();
}

class _ClassAndCodePageState extends State<ClassAndCodePage> {

  String dropdownValue = '1 клас';
  @override
  Widget build(BuildContext context) {
    if(CurrentUser.connectionId == null) {
      return FutureBuilder<String> (
          future: DatabaseService.getNextConnectionId(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              CurrentUser.connectionId = snapshot.data;
              return Scaffold(
                body:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      child: Text("Більше про тебе", style: TextStyle(fontFamily: "Gilroy", fontSize: 35, fontWeight: FontWeight.bold),),
                      padding: EdgeInsets.all(25),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          child: Text("За якою програмою ти хочеш навчатися?",style: TextStyle(fontFamily: "Gilroy", fontSize: 20,color: Color.fromRGBO(1, 2, 4, 5),),),
                          padding: EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                              color: Color.fromRGBO(38, 132, 254, 100),
                              fontSize: 25,
                            ),

                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['1 клас', '2 клас', '3 клас', '4 клас', '5 клас', '6 клас','7 клас', '8 клас', '9 клас', '10 клас', '11 клас']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                                .toList(),
                          ),
                        ),
                        Padding(
                          child: Text("Твій код" ,style: TextStyle(fontFamily: "Gilroy", fontSize: 20, color: Color.fromRGBO(1, 2, 4, 5),),),
                          padding: EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                          child: Container(
                            height: 40,
                            child: Text(CurrentUser.connectionId),
                          ),
                        ),

                        Image(image: AssetImage('assets/sign_up_pic/sign_up_inform.png',),height: 270,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
                          child: MaterialButton(
                            child:
                            Text("Продовжити", style: TextStyle(fontFamily: "Gilroy", fontSize: 35),),
                            color: Color.fromRGBO(38, 132, 254, 100),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MotivationPage()));
                            },
                            textColor: Colors.white,
                            height: 70,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              );
            }else{
              return Loading();
            }
          }
      );
    }
    else {
      return Scaffold(
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              child: Text("Більше про тебе", style: TextStyle(fontFamily: "Gilroy", fontSize: 35, fontWeight: FontWeight.bold),),
              padding: EdgeInsets.all(25),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  child: Text("За якою програмою ти хочеш навчатися?",style: TextStyle(fontFamily: "Gilroy", fontSize: 20,color: Color.fromRGBO(1, 2, 4, 5),),),
                  padding: EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 132, 254, 100),
                      fontSize: 25,
                    ),

                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['1 клас', '2 клас', '3 клас', '4 клас', '5 клас', '6 клас','7 клас', '8 клас', '9 клас', '10 клас', '11 клас']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                        .toList(),
                  ),
                ),
                Padding(
                  child: Text("Твій код" ,style: TextStyle(fontFamily: "Gilroy", fontSize: 20, color: Color.fromRGBO(1, 2, 4, 5),),),
                  padding: EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                  child: Container(
                    height: 40,
                    child: Text(CurrentUser.connectionId),
                  ),
                ),

                Image(image: AssetImage('assets/sign_up_pic/sign_up_inform.png',),height: 270,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
                  child: MaterialButton(
                    child:
                    Text("Продовжити", style: TextStyle(fontFamily: "Gilroy", fontSize: 35),),
                    color: Color.fromRGBO(38, 132, 254, 100),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MotivationPage()));
                    },
                    textColor: Colors.white,
                    height: 70,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ],
        ),

      );
    }

  }
}