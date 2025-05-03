import 'package:bazeecha/pages/agent_x/agents_guide.dart';
import 'package:bazeecha/pages/agent_x/cases.dart';
import 'package:bazeecha/pages/agent_x/dares.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';
import 'package:bazeecha/utils/icons.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:bazeecha/widgets/small.dart';
import 'package:flutter/material.dart';

class AgentXPage extends StatelessWidget {
  const AgentXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Dimensions.height30),
                HeaderText(text: "Agent X", color: AppColor.green),
                SmallText(
                  text: "Our board game features are now available online!",
                ),
                SizedBox(height: Dimensions.height40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgentsGuide()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.green,

                    padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      left: Dimensions.width15,
                      right: Dimensions.width15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(Dimensions.screenWidth - 20, 80),
                  ),

                  child: HeaderText(
                    text: "AGENTS GUIDE",
                    size: 25,
                    color: AppColor.white,
                  ),
                ),
                SizedBox(height: Dimensions.height30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cases()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.red,

                    padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      left: Dimensions.width15,
                      right: Dimensions.width15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(Dimensions.screenWidth - 20, 150),
                  ),

                  child: Image.asset("assets/images/case.png", width: 80),
                ),
                SizedBox(height: Dimensions.height30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dares()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.red,

                    padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      left: Dimensions.width15,
                      right: Dimensions.width15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(Dimensions.screenWidth - 20, 150),
                  ),

                  child: AppIcons(
                    icon: Icons.question_mark,
                    backgroundColor: Colors.transparent,
                    iconColor: AppColor.white,
                    iconSize: 40,
                    size: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
