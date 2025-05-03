import 'package:bazeecha/main_scaffold.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/widgets/headings.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Column(
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
          Center(
            child: HeaderText(text: "CART WILL COME HERE", color: AppColor.red),
          ),
        ],
      ),
      selectedIndex: 1,
      onNavTapped: (int index) {},
      showBottomNavBar: false,
    );
  }
}
