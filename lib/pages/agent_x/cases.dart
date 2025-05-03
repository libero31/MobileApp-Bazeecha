import 'dart:async';
import 'dart:math';
import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';
import 'package:bazeecha/widgets/expandable_text.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:bazeecha/widgets/case_cards.dart';

class Cases extends StatefulWidget {
  const Cases({super.key});

  @override
  State<Cases> createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  StreamController<int> controller = StreamController<int>();
  int? outcome;
  bool showDareCard = false;
  bool answerShowed = false;
  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  void _closeCaseCard() {
    setState(() {
      showDareCard = false;
    });
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
            HeaderText(text: "Cases Page"),
            ExpandableText(text: "some yapping"),
            SizedBox(height: 40),
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
                          imagePath: "assets/images/cases1.png",
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
                            top: Dimensions.height10,
                            bottom: Dimensions.height10,
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
                              Expanded(
                                child: CaseCard(
                                  title: "The Disappearing Heiress",
                                  caseDescription:
                                      "Roshee, a wealthy heiress, has gone missing from her family estate. Her uncle insists she’s been kidnapped, but there is no ransom demand. Imran is called to investigate.",
                                  clues: [
                                    "A broken window in the study.",
                                    "Roshee’s diary containing an odd entry about wanting to escape her family.",
                                    "A muddy footprint found near the garden gate.",
                                  ],
                                  suspects: [
                                    "Uncle Tahir – Wants to inherit his niece's fortune.",
                                    "Housekeeper Sadaf – Often heard arguing with Roshee.",
                                    "Zafar-ul-Mulk – A suitor who seemed overly eager to marry Miss Vance.",
                                  ],
                                  solution:
                                      "Roshee staged her own disappearance to escape her controlling family. The broken window was part of her ruse, and the muddy footprint was hers as she sneaked out through the garden. The diary entry reveals her desire for independence, not kidnapping. The family’s suspicion was misplaced.",
                                  onComplete: _closeCaseCard,
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

List<FortuneItem> _items({required String imagePath, required Color color}) {
  List<FortuneItem> output = [];
  for (var item = 1; item < 9; item++) {
    output.add(
      FortuneItem(
        style: FortuneItemStyle(color: color, borderWidth: 0.0),
        child: RotatedBox(
          quarterTurns: 1,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Image.asset(imagePath, width: 35),
          ),
        ),
      ),
    );
  }
  return output;
}
