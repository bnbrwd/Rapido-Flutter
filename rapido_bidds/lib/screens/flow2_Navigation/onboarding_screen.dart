import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var size, height, width, statusBarHeight;

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  var _pageIndex = 1;
  var _cardIndex = 0;
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    Widget _getPageDetails() {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/image/ellipse19.png'),
            ),
            SizedBox(height: height * (32 / 640)),
            Text(
              'Lorem ipsum don',
              style: TextStyle(
                color: Color.fromRGBO(32, 33, 34, 1),
                fontSize: 18,
              ),
            ),
            SizedBox(height: height * (16 / 640)),
            Align(
              alignment: Alignment.center,
              child: Text(
                'amet, consectetur adipi pharetra',
                style: TextStyle(
                  color: Color.fromRGBO(32, 33, 34, 1),
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: height * (14 / 640)),
            Align(
              alignment: Alignment.center,
              child: Text(
                'nisl, sapien sed consequat.',
                style: TextStyle(
                  color: Color.fromRGBO(32, 33, 34, 1),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _getSmoothPageIndicator(List<Container> pages) {
      return Container(
        // color: Colors.red.withOpacity(.4),
        child: SmoothPageIndicator(
          controller: controller,
          count: pages.length,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 16,
              height: 6,
              color: Color.fromRGBO(244, 190, 62, 1),
              // rotationAngle: 180,
              // verticalOffset: -10,
              borderRadius: BorderRadius.circular(20),
              // dotBorder: DotBorder(
              //   padding: 2,
              //   width: 2,
              //   color: Colors.indigo,
              // ),
            ),
            dotDecoration: DotDecoration(
              width: 9,
              height: 9,
              color: Colors.grey,
              // dotBorder: DotBorder(
              //   padding: 2,
              //   width: 2,
              //   color: Colors.grey,
              // ),
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(2),
              //     topRight: Radius.circular(16),
              //     bottomLeft: Radius.circular(16),
              //     bottomRight: Radius.circular(2)),
              borderRadius: BorderRadius.circular(16),
              verticalOffset: 0,
            ),
            spacing: 6.0,
            // activeColorOverride: (i) => colors[i],
            // inActiveColorOverride: (i) => colors[i],
          ),
        ),
      );
    }

    final pages = List.generate(
        3,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                // color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: Container(
                height: 300,
                child: Center(child: _getPageDetails()
                    // Text(
                    //   "Page $index",
                    //   style: TextStyle(color: Colors.indigo),
                    // ),
                    ),
              ),
            ));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: width * (16 / 360),
            right: width * (16 / 360),
            top: height * (36 / 640),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _pageIndex > 1
                      ? GestureDetector(
                          child: Container(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child:
                                      Image.asset('assets/image/eclipse.png'),
                                ),
                                Positioned(
                                  top: height * 0.02,
                                  left: width * 0.04,
                                  child: Image.asset('assets/image/Vector.png'),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _pageIndex--;
                            });
                          },
                        )
                      : Container(
                          child: Text(''),
                        ),
                  GestureDetector(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/image/eclipse.png'),
                          ),
                          Positioned(
                            top: height * 0.017,
                            left: width * 0.04,
                            child: Image.asset(
                              'assets/image/drwer.png',
                              height: height * 0.023,
                              width: width * 0.051,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: height * (41 / 640)),
              SizedBox(
                height: height * (264 / 640),
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    _cardIndex = index;
                    print("_cardIndex = ${_cardIndex}");
                    return pages[index % pages.length];
                  },
                ),
              ),
              _getSmoothPageIndicator(pages),
              SizedBox(height: height * (55 / 640)),
              _pageIndex < 3
                  ? GestureDetector(
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset('assets/image/ellipse17.png'),
                            ),
                            Positioned(
                              top: height * 0.025,
                              left: width * 0.43,
                              child: Image.asset(
                                'assets/image/vector11.png',
                                height: height * 0.023,
                                width: width * 0.051,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _pageIndex++;
                          print('_pageIndex${_pageIndex}');
                        });
                      },
                    )
                  : Container(
                      width: double.infinity,
                      height: height * 0.075,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(249, 216, 21, 1)),
                          foregroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(32, 33, 34, 1)),
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
              SizedBox(height: height * (24 / 640)),
              _pageIndex < 3
                  ? Container(
                      child: TextButton(
                        child: Text('skip'),
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {},
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}