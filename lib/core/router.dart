import 'package:djangowithflutter/authenticaion/login.dart';
import 'package:djangowithflutter/authenticaion/singup.dart';
import 'package:djangowithflutter/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    navigatorKey: MainApp.navigatorKey,
    initialLocation: SingupPage.routePath,
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
      )
    ]);
