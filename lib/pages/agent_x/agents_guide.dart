import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:flutter/material.dart';

class AgentsGuide extends StatelessWidget {
  const AgentsGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 1,
      onNavTapped: (int index) {},
      showBottomNavBar: false,
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    color: AppColor.green,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              HeaderText(
                text: "HOW TO PLAY WILL COME HERE",
                color: AppColor.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
