import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavka/screens/authenticate/register.dart';
import 'package:mavka/screens/authenticate/sign_in.dart';
import 'package:mavka/shared/hex_color.dart';
import 'package:mavka/utilities/styles.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    final list = <Widget>[];
    for (var i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? HexColor('2684FE') : Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('I am at auth');
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                height: 300.0,
                                width: 300.0,
                                image: AssetImage(
                                  'assets/onboarding0.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Створи космічну\nракету',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                height: 300.0,
                                width: 300.0,
                                image: AssetImage(
                                  'assets/onboarding1.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Вирости красиву\nкалину!',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                height: 300.0,
                                width: 300.0,
                                image: AssetImage(
                                  'assets/onboarding2.png',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Розроби вакцину\nвід коронавірусу',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 100.0,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              MaterialButton(
                color: HexColor('2684FE'),
                height: 100.0,
                minWidth: 179,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              const SizedBox(width: 2.0),
              MaterialButton(
                height: 100.0,
                color: HexColor('2684FE'),
                minWidth: 179,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: const Text('Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
              ),
            ],
          ),
        ));
  }
}
