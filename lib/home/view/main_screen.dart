import 'package:flutter/material.dart';
import 'package:djangowithflutter/home/view/home_page.dart';

import 'package:djangowithflutter/core/screen_type.dart';

import 'package:djangowithflutter/authenticaion/view/mobile-folder/bottom_bar/bottom_bar.dart';

import 'package:djangowithflutter/plants/plants.dart';

class MainScreen extends StatefulWidget {
  static const routePath = '/MainScreen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _webScreens = [
    const HomeScreen(), // Home screen
    const PalantsScreen(), // Plants screen
  ];

  void _onNavItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenType.isMobile(context);

    return Scaffold(
      appBar: CommenAppbar(
        onMenuItemTap: (index) {
          _onNavItemSelected(index);
        },
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const <Widget>[
                  DrawerHeader(child: Text('Menu')),
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                ],
              ),
            )
          : null,
      body: isMobile
          ? const BottomBarScreen() // For mobile, you can use a bottom bar
          : SingleChildScrollView(
              child: Column(
              children: [
                ImageCarousel(),
                _webScreens[_selectedIndex],
                const ResponsiveFooter(),
              ],
            )), // No drawer for web

      //  // For web, switch between screens
    );
  }
}
