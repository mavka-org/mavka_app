import "package:flutter/material.dart";

class PageViewerReturn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 4);
    return PageView(
      controller: controller,
      children: <Widget>[
        page_one(),
        page_two(),
        page_three(),
      ],
    );
  }
}

class page_one extends StatefulWidget {
  @override
  _page_oneState createState() => _page_oneState();
}

class _page_oneState extends State<page_one> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Column( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              child:Text("Що описує тебе найкраще", style: TextStyle(fontFamily: "Gilroy", fontSize: 35, fontWeight: FontWeight.bold),),
              padding: EdgeInsets.all(25),
              ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                MaterialButton(
                  child: 
                  Text("Учень(-ця)", style: TextStyle(fontFamily: "Gilroy", fontSize: 35),),
                  color: Color.fromRGBO(38, 132, 254, 100),
                  onPressed: (){},
                  textColor: Colors.white,
                  height: 70,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  child: 
                  Text("Батьки", style: TextStyle(fontFamily: "Gilroy", fontSize: 35),),
                  color: Color.fromRGBO(38, 132, 254, 100),
                  onPressed: (){},
                  textColor: Colors.white,
                  height: 70,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Image(image: AssetImage("assets/sign_up_pic/sign_up_backpack.png",),height: 300,),
                ],)
              ],
              ),
            ),
          ],
        ),
    );
  }
}
class page_two extends StatefulWidget {
  @override
  _page_twoState createState() => _page_twoState();
}

class _page_twoState extends State<page_two> {
  
String dropdownValue = '1 клас';
  @override
  Widget build(BuildContext context) {
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
                    child: Text("Якщо, твої батьки створили реєстраційний код, додай його сюди",style: TextStyle(fontFamily: "Gilroy", fontSize: 20,color: Color.fromRGBO(1, 2, 4, 5),),),
                    padding: EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top:10,right:25,bottom:10),
                    child: Container(
                      height: 40,
                      child: TextField(
                        style: TextStyle(fontFamily: 'Gilroy',fontSize: 25),
                        decoration: InputDecoration(
                        
                        hintText: 'Наприклад, АА0123'
                      ),
                    ),
                    ),
                  ),
                
                Image(image: AssetImage('assets/sign_up_pic/sign_up_inform.png',),height: 270,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
                  child: MaterialButton(
                    child: 
                    Text("Продовжити", style: TextStyle(fontFamily: "Gilroy", fontSize: 35),),
                    color: Color.fromRGBO(38, 132, 254, 100),
                    onPressed: (){},
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

class page_three extends StatefulWidget {
  @override
  _page_threeState createState() => _page_threeState();
}

class _page_threeState extends State<page_three> {
  @override

  
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Gilroy",),
      home: Scaffold(
        body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left:30,top:30),
                  child: Text("Яка твоя мрія?", style: TextStyle(fontFamily: "Gilroy", fontSize: 30, fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left:35,top:30),
                  child:Container(
                    width:300,
                    height: 50,
                    child: Text("Що ти хочеш зробити зі своїми набутими знаннями?", style: TextStyle(fontFamily: "Gilroy", fontSize: 20),
                  ), 
                  ),
                ),
              ],
            ),
            
            Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
               Stack(
                 overflow: Overflow.visible,
                 children: <Widget>[
                   Image(image: AssetImage("assets/sign_up_pic/sign_up_rocket.png"),width: 200,height: 200,alignment: Alignment(1,0),),
                   Positioned(
                     left: -240,
                     top: 100,
                     child: Container(
                       width: 300,
                       height: 70,
                       child: MaterialButton(
                          child: 
                          Text("Космічну ракету", style: TextStyle(fontFamily: "Gilroy", fontSize: 25),),
                          color: Color.fromRGBO(38, 132, 254, 100),
                          onPressed: (){},
                          textColor: Colors.white,
                          height: 70,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ), 
                     ),
                   ),
                 ],
               ),
              ],
            ),
            Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                        Image(image: AssetImage("assets/sign_up_pic/sign_up_tree.png"),width: 200,height: 200,alignment: Alignment(-1,0),),
                        Positioned(
                                    left: 100,
                                    top: 100,
                                    child:
                                        MaterialButton(
                                                child: 
                                                  Text("Виростити красиву калину", style: TextStyle(fontFamily: "Gilroy", fontSize: 25,),),
                                                  color: Color.fromRGBO(38, 132, 254, 100),
                                                  onPressed: (){},
                                                  height: 70,
                                                  textColor: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                              ),
                                    ),
                            ],
                ),
                ],
              ),
              Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
               Stack(
                 overflow: Overflow.visible,
                 children: <Widget>[
                   Image(image: AssetImage("assets/sign_up_pic/sign_up_microbe.png"),width: 200,height: 180,alignment: Alignment(1,0),),
                   Positioned(
                     left: -215,
                     top: 65,
                     child: Container(
                              width: 300,
                              height: 80,
                              child: MaterialButton(
                                            child: 
                                            Center(child: Text("Розробити вакцину проти Коронавірусу", style: TextStyle(fontFamily: "Gilroy", fontSize: 25),),),
                                            color: Color.fromRGBO(38, 132, 254, 100),
                                            onPressed: (){},
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      ),
                              ),
                   ),
                 ],
               ),
              ],
            ),
          ],
        ),
        
    ),
    );
  }
}