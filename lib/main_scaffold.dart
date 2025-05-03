import 'package:bazeecha/pages/home/main_home_page.dart';
import 'package:bazeecha/pages/products/cart.dart';
import 'package:bazeecha/pages/side_bar/about_us.dart';
import 'package:bazeecha/pages/side_bar/blog.dart';
import 'package:bazeecha/pages/side_bar/settings.dart';
import 'package:flutter/material.dart';
import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';
import 'package:bazeecha/widgets/headings.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function(int) onNavTapped;
  final bool showBottomNavBar;

  const MainScaffold({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onNavTapped,
    this.showBottomNavBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe8e8e8),
        elevation: 0,
        title: Image.asset('assets/images/bazeecha.png', height: 25),
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, color: AppColor.red),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppColor.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      drawer: SizedBox(
        width: Dimensions.screenWidth * 0.7,
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: HeaderText(text: 'Home'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainHomePage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: HeaderText(text: 'About us'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs()),
                        );
                      },
                    ),
                    ListTile(
                      title: HeaderText(text: 'Blog'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Blog()),
                        );
                      },
                    ),
                    ListTile(
                      title: HeaderText(text: 'Settings'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: body,
      bottomNavigationBar:
          showBottomNavBar
              ? BottomNavigationBar(
                currentIndex: selectedIndex,
                selectedItemColor: AppColor.red,
                unselectedItemColor: Colors.grey,
                onTap: onNavTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.article),
                    label: 'Agent X',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.games),
                    label: 'Minigames',
                  ),
                ],
              )
              : null,
    );
  }
}
