import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Center(
        child: HeaderText(text: "BLOG WILL COME HERE", color: AppColor.red),
      ),
      selectedIndex: 0,
      onNavTapped: (int index) {},
      showBottomNavBar: false,
    );
  }
}
