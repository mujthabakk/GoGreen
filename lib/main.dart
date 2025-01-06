import 'package:djangowithflutter/authenticaion/service/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'core/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessngerKey = GlobalKey<ScaffoldMessengerState>();
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService().login(password: "1234567890", username: "SALIQKT");
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessngerKey,
      routerConfig: router,
      // theme: lightTheme,
    );
  }
}
