import 'dart:async';
import 'dart:math';
import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';
import 'package:bazeecha/widgets/expandable_text.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Dares extends StatefulWidget {
  const Dares({super.key});

  @override
  State<Dares> createState() => _DaresState();
}

class _DaresState extends State<Dares> {
  StreamController<int> controller = StreamController<int>();
  int? outcome;
  bool showDareCard = false;
  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 1, // Set to 1 for the Agent X page
      onNavTapped: (int index) {
        // Handle navigation when BottomNavigationBar is tapped
      },
      showBottomNavBar: false,
      body: SafeArea(
        minimum: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(
                  color: AppColor.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            HeaderText(text: "Dares Page"),
            ExpandableText(text: "some yapping"),
            SizedBox(height: Dimensions.height30),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              height: Dimensions.screenWidth,

              child: Stack(
                children: [
                  Material(
                    shape: const CircleBorder(),
                    elevation: 10,
                    child: FortuneWheel(
                      animateFirst: false,
                      hapticImpact: HapticImpact.light,
                      selected: controller.stream,
                      items: [
                        ..._items(
                          iconWheel: Icon(
                            Icons.question_mark,
                            size: 55,
                            color: AppColor.white,
                          ),
                          color: AppColor.green,
                        ),
                      ],
                      indicators: const [
                        FortuneIndicator(
                          alignment: Alignment.topCenter,
                          child: TriangleIndicator(
                            color: Color.fromARGB(255, 225, 42, 42),
                            width: 30.0,
                            height: 30.0,
                            elevation: 10,
                          ),
                        ),
                      ],
                      onFling: () {
                        List<int> outcomes = [0, 1, 2, 3, 4, 5, 6, 7, 8];
                        setState(() {
                          outcome = outcomes[Random().nextInt(outcomes.length)];
                        });
                        controller.add(outcome ?? 1);
                      },
                      onAnimationEnd: () {
                        setState(() {
                          showDareCard = true;
                        });
                      },
                    ),
                  ),
                  if (showDareCard)
                    Center(
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.red, // Background color
                        child: Container(
                          padding: EdgeInsets.only(
                            left: Dimensions.width30,
                            right: Dimensions.width30,
                            top: Dimensions.height30,
                            bottom: Dimensions.height30,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.red,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius40,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dares[outcome!],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: Dimensions.height15),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showDareCard = false; // hide the card
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColor.green, // background color
                                  // text color
                                  elevation: 5,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ), // rounded corners
                                  ),
                                ),
                                child: HeaderText(
                                  text: "Dare Completed",
                                  size: 20,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<FortuneItem> _items({required Icon iconWheel, required Color color}) {
  List<FortuneItem> output = [];
  for (var item = 1; item < 9; item++) {
    output.add(
      FortuneItem(
        style: FortuneItemStyle(color: color, borderWidth: 0.0),
        child: RotatedBox(
          quarterTurns: 1,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: iconWheel,
          ),
        ),
      ),
    );
  }
  return output;
}

List<String> dares = [
  "Pretend you’re a stand-up comedian and tell three dad jokes in Urdu",
  "Do your best evil villain laugh.",
  "Sing an old Pakistani song  karaoke-style",
  "Name the provinces of Pakistan",
  "Name the Capital Cities of every province of Pakistan",
  "Name any 3 people who got the Nishan-e-Haider",
  "Name any 5 Famous Pakistani Books",
  "Recreate a funny Pakistani meme (crowds choice).",
  "Sing Pakistan’s National Anthem",
];
