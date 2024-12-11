import 'package:djangowithflutter/authenticaion/view/mobile-folder/authenication/login.dart';
import 'package:djangowithflutter/authenticaion/web-folder/authenication/login.dart';
import 'package:djangowithflutter/core/size.dart';
import 'package:flutter/material.dart';

class LoginPapge extends StatelessWidget {
  static const routePath = '/login';
  const LoginPapge({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      body: screenWidth.width < breakpoint
          ? const MobileLogin() // Display mobile layout for small screens
          : WebLoginPage(),
    );
  }
}
