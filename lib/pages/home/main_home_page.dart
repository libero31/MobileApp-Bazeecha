import 'package:bazeecha/pages/agent_x/agent_x_page.dart';
import 'package:bazeecha/pages/home/home_page.dart';
import 'package:bazeecha/pages/minigames/main_minigames.dart';
import 'package:flutter/material.dart';
import 'package:bazeecha/main_scaffold.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), AgentXPage(), MainMinigames()];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: _pages[_selectedIndex],
      selectedIndex: _selectedIndex,
      onNavTapped: _onNavTapped,
    );
  }
}
