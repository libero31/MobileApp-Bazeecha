import 'package:bazeecha/pages/products/products_detail.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:bazeecha/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //word of the day slider
            SizedBox(
              height: Dimensions.pageView,
              child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                },
              ),
            ),

            //dots indicator
            DotsIndicator(
              dotsCount: 3,
              position: currPageValue,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: AppColor.red,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Container(
              height: 30,
              width: Dimensions.screenWidth,
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: RText(
                text: "Products",
                color: Color.fromARGB(255, 180, 178, 178),
                size: 15,
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: Dimensions.pageViewContainer,
                  margin: EdgeInsets.only(
                    // left: Dimensions.width15,
                    // right: Dimensions.width15,
                    top: Dimensions.height15,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(146, 78, 156, 91),
                    //borderRadius: BorderRadius.circular(Dimensions.radius20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(117, 94, 93, 93),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5.0,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5.0,
                        offset: Offset(5, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Transform.rotate(
                            angle: -0.25,
                            child: Container(
                              margin: EdgeInsets.all(Dimensions.width40),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/image3.png"),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -30,
                            top: 10,
                            child: Transform.rotate(
                              angle: 0.2,
                              child: Container(
                                margin: EdgeInsets.all(Dimensions.width30),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 94, 93, 93),
                                      offset: Offset(0, 3),
                                      blurRadius: 5,
                                    ),
                                  ],
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/image4.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 5),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 50, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderText(text: "AgentX"),
                              RText(text: "Product detail."),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsDetail(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.red,

                                  padding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    left: Dimensions.width15,
                                    right: Dimensions.width15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  minimumSize: Size(45, 10),
                                ),
                                child: HeaderText(
                                  text: "BUY NOW",
                                  size: 15,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? AppColor.green : AppColor.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/wordoftheday2.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: Dimensions.height40,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF242424),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(155, 105, 104, 104),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 60, bottom: 60),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    image: AssetImage("assets/images/blogText.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
