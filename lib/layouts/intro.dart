import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/components/logo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroLayout extends StatelessWidget {
  final bool isHeaderSmall;
  final Widget child;

  const IntroLayout({@required this.child, this.isHeaderSmall = true});

  @override
  Widget build(BuildContext context) {
    final _header = isHeaderSmall
        ? const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: LogoComponent(Colors.white),
            ),
          )
        : Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoComponent(Colors.white),
                const SizedBox(
                  height: 32,
                ),
                _IntroSlider(),
              ],
            ),
          );

    final _body = Hero(
      tag: 'card',
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Material(
          color: Colors.grey[200],
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: child),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blue[300],
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            _header,
            if (isHeaderSmall)
              Expanded(
                child: _body,
              )
            else
              _body
          ],
        ),
      ),
    );
  }
}

class _IntroSlider extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          SmoothPageIndicator(
            count: 3,
            effect: ExpandingDotsEffect(
                radius: 4,
                dotWidth: 14,
                dotHeight: 10,
                expansionFactor: 2,
                dotColor: Colors.grey[100],
                activeDotColor: Colors.white),
            controller: _controller,
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 230,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              physics: const ScrollPhysics(),
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/intro/intro_1.svg',
                      height: 180,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'title #1',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/intro/intro_2.svg',
                      height: 180,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'title #2',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/intro/intro_3.svg',
                      height: 180,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'title #3',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      );
}
