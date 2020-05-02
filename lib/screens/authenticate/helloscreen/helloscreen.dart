import "package:flutter/material.dart";
import 'package:mavka/screens/authenticate/helloscreen/slide.dart';
import 'package:mavka/screens/authenticate/helloscreen/slide_dots.dart';
import 'package:mavka/screens/authenticate/helloscreen/slideitem.dart';
import 'package:mavka/screens/authenticate/helloscreen/slide_dots.dart';
import 'dart:async';

class GettingStart extends StatefulWidget {
  @override
  _GettingStartState createState() => _GettingStartState();
}

class _GettingStartState extends State<GettingStart> {
  int _currentpage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentpage < 2) {
        _currentpage++;
      } else {
        _currentpage = 0;
      }
      _pageController.animateToPage(_currentpage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Gilroy", backgroundColor: Colors.white),
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for(int i = 0;i < slidelist.length;i++)
                                if (i == _currentpage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                                
                              
                            ],
                          ),

                        ),
                      ],
                    ),
                    PageView.builder(
                      itemCount: slidelist.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: BorderSide(color: Color.fromRGBO(38, 132, 254, 100), width: 1),
                    ),
                    highlightColor: Colors.blue[50],
                    highlightElevation: 5,
                    elevation: 2,
                  ),
                  RaisedButton(
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: BorderSide(color: Color.fromRGBO(38, 132, 254, 100), width: 1),
                    ),
                    highlightColor: Colors.blue[50],
                    highlightElevation: 5,
                    elevation: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
