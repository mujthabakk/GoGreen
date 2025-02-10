import 'package:djangowithflutter/core/commen_widget/commen_app_bar_widget.dart';
import 'package:djangowithflutter/home/view/bloc/home_bloc.dart';
import 'package:djangowithflutter/offer/offer_screen.dart';
import 'package:djangowithflutter/pots&planter/pots&plantet_screen.dart';
import 'package:djangowithflutter/seed/seed_screen.dart';
import 'package:flutter/material.dart';
import 'package:djangowithflutter/home/view/home_page.dart';

import 'package:djangowithflutter/core/screen_type.dart';

import 'package:djangowithflutter/authenticaion/view/mobile-folder/bottom_bar/bottom_bar.dart';

import 'package:djangowithflutter/plants/plants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  static const routePath = '/MainScreen';

  const MainScreen({super.key});

  final List<Widget> _webScreens = const [
    HomeScreen(), // Home screen
    PalantsScreen(), // Plants screen
    SeedScreen(),
    PotsplantetScreen(),
    OfferScreen()
  ];

  void _onNavItemSelected(BuildContext context, int index) {
    context.read<HomeBloc>().add(HomeEvent.selectScreen(index));
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenType.isMobile(context);

    return Scaffold(
      appBar: CommenAppbar(
        onMenuItemTap: (index) {
          _onNavItemSelected(context, index);
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int selectedIndex = 0;
          state.when(
            initial: () {
              selectedIndex = 0;
            },
            screenSelected: (index) {
              selectedIndex = index;
            },
          );

          return isMobile
              ? const BottomBarScreen() // For mobile, you can use a bottom bar
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageCarousel(),
                      _webScreens[selectedIndex],
                      const ResponsiveFooter(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
