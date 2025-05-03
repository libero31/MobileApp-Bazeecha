import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Center(
        child: HeaderText(text: "SETTINGS WILL COME HERE", color: AppColor.red),
      ),
      selectedIndex: 0,
      onNavTapped: (int index) {},
      showBottomNavBar: false,
    );
  }
}
