import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slide1/utilities/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 36.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            height: _screenSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.5],
                colors: [
                  Color(0xFFEC9F05),
                  Color(0xFFEF6F00),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () => print(
                          'Skip',
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 600.0,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: SvgPicture.asset(
                                  'assets/images/img1.svg',
                                  height: 300.0,
                                  width: 300.0,
                                )),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  'Connect People\naround the world',
                                  style: kTitleStyle,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                    'assets/images/img2.svg',
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  'Live your life smarter\nwith us',
                                  style: kTitleStyle,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                    'assets/images/img3.svg',
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  'Get a new experience\nof imagination',
                                  style: kTitleStyle,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
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
                    _currentPage != _numPages - 1
                        ? Align(
                            alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                                onPressed: () => _pageController.nextPage(
                                      duration: Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.ease,
                                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ],
                                )),
                          )
                        : Text('')
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomSheet: _currentPage == _numPages - 1
            ? Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEF6F00),
                ),
                child: GestureDetector(
                  onTap: () => print('Get Started'),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            22,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.orange,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Text(''));
  }
}
