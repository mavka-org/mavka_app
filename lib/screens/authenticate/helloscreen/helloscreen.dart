import 'package:flutter/material.dart';
import 'package:mavka/screens/authenticate/helloscreen/slide.dart';
import 'package:mavka/screens/authenticate/helloscreen/slide_dots.dart';

import '../../../screens/authenticate/helloscreen/slideitem.dart';
import '../register.dart';
import '../sign_in.dart';

class GettingStart extends StatefulWidget {
  @override
  _GettingStartState createState() => _GettingStartState();
}

class _GettingStartState extends State<GettingStart> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) => setState(() => _currentPage = index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Gilroy', backgroundColor: Colors.white),
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
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  const SlideDots(isActive: true)
                                else
                                  const SlideDots(isActive: false)
                            ],
                          ),
                        ),
                      ],
                    ),
                    PageView.builder(
                      itemCount: slideList.length,
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: const BorderSide(
                          color: Color.fromRGBO(38, 132, 254, 100)),
                    ),
                    highlightColor: Colors.blue[50],
                    highlightElevation: 5,
                    elevation: 2,
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: const BorderSide(
                          color: Color.fromRGBO(38, 132, 254, 100)),
                    ),
                    highlightColor: Colors.blue[50],
                    highlightElevation: 5,
                    elevation: 2,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),

//              Column(
//                children: [
//                  ButtonTheme(
//                    minWidth: 280,
//                    height: 40,
//                    child: OutlineButton(
//                      onPressed: () {},
//                      child: Text(
//                        'ВХІД',
//                        style: GoogleFonts.comfortaa(
//                            fontWeight: FontWeight.w700, fontSize: 16),
//                      ),
//                    ),
//                  ),
//                  const SizedBox(
//                    height: 6,
//                  ),
//                  ButtonTheme(
//                    minWidth: 280,
//                    height: 40,
//                    child: OutlineButton(
//                      onPressed: () {},
//                      child: Text(
//                        'РЕЄСТРАЦІЯ',
//                        style: GoogleFonts.comfortaa(
//                            fontWeight: FontWeight.w700, fontSize: 16),
//                      ),
//                    ),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      IconButton(
//                        onPressed: () {},
//                        icon: const Icon(
//                          FlutterIcons.facebook_f_faw5d,
//                          size: 22,
//                        ),
//                      ),
//                      IconButton(
//                        onPressed: () {},
//                        icon: const Icon(
//                          FlutterIcons.google_faw5d,
//                          size: 22,
//                        ),
//                      )
//                    ],
//                  )
//                ],
//              )
            ],
          ),
        ),
      ),
    );
  }
}
