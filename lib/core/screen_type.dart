import 'package:flutter/material.dart';

class ScreenType {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > 600 &&
      MediaQuery.of(context).size.shortestSide < 1024;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
}
