import 'package:djangowithflutter/authenticaion/view/mobile-folder/authenication/splashscreen.dart';
import 'package:djangowithflutter/authenticaion/web-folder/authenication/singup.dart';
import 'package:djangowithflutter/core/size.dart';
import 'package:flutter/material.dart';

class SingupPage extends StatelessWidget {
  static const routePath = '/singup';
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      body: screenWidth.width < breakpoint
          ? const SplashScreen() // Display mobile layout for small screens
          : const WebSingupPage(), // Display web layout for larger screens
    );
  }
}
