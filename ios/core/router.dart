import 'package:djangowithflutter/authenticaion/login.dart';
import 'package:djangowithflutter/authenticaion/singup.dart';
import 'package:djangowithflutter/home/view/main_screen.dart';
import 'package:djangowithflutter/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    navigatorKey: MainApp.navigatorKey,
    initialLocation: MainScreen.routePath,
    routes: [
      GoRoute(
        path: SingupPage.routePath,
        builder: (context, state) {
          return const SingupPage();
        },
        // redirect: RouterRedirectServices.checkBaseUrl,
      ),
      GoRoute(
        path: LoginPapge.routePath,
        builder: (context, state) {
          return const LoginPapge();
        },
        // redirect: RouterRedirectServices.checkBaseUrl,
      ),
      GoRoute(
        path: MainScreen.routePath,
        builder: (context, state) {
          return const MainScreen();
        },
        // redirect: RouterRedirectServices.checkBaseUrl,
      )
    ]);
