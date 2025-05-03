import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';
import 'package:bazeecha/widgets/expandable_text.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:bazeecha/widgets/small.dart';
import 'package:flutter/material.dart';

class ProductsDetail extends StatelessWidget {
  const ProductsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 0,
      onNavTapped: (int index) {
        // Handle navigation when BottomNavigationBar is tapped
      },
      showBottomNavBar: false,
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: Dimensions.screenHeight / 1.3,

                child: Stack(
                  children: [
                    //product image
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.productsHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/agentX.png"),
                          ),
                        ),
                      ),
                    ),
                    //product icons
                    Positioned(
                      top: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackButton(
                            color: AppColor.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),

                    //Heading text
                    Positioned(
                      top: (Dimensions.productsHeight - 30),
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: Dimensions.width30,
                          top: Dimensions.height20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius40),
                            topLeft: Radius.circular(Dimensions.radius40),
                          ),
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderText(
                              text: "Agent X",
                              color: AppColor.red,
                              size: 30,
                            ),
                            SmallText(
                              text: "Board Game",
                              color: Color.fromARGB(255, 205, 204, 204),
                              size: 10,
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                child: ExpandableText(
                                  text:
                                      "In the game, 4 to 10 players work together as “agents” to reach the HQ present on a classic game  board, while encountering challenges such as dares, solving cases inspired by the source material  and figuring out who the “traitor” is amongst them. The game is specifically designed to foster  collaboration and increase quality family time that connects generations.In the game, 4 to 10 players work together as “agents” to reach the HQ present on a classic game  board, while encountering challenges such as dares, solving cases inspired by the source material  and figuring out who the “traitor” is amongst them. The game is specifically designed to foster  collaboration and increase quality family time that connects generations.",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffffffff),
                child: Container(
                  height: Dimensions.screenHeight / 7,
                  padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    bottom: Dimensions.height30,
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius40),
                      topLeft: Radius.circular(Dimensions.radius40),
                    ),
                    color: Color(0xffe8e8e8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          left: Dimensions.width15,
                          right: Dimensions.width15,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.remove,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(width: 10),
                            HeaderText(text: "0"),
                            SizedBox(width: 10),
                            Icon(
                              Icons.add,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          right: Dimensions.width20,
                          left: Dimensions.width20,
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 5,
                              color: Color.fromARGB(255, 209, 206, 206),
                            ),
                          ],
                        ),
                        child: SmallText(
                          text: "2000rs| Add to Cart",
                          size: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
