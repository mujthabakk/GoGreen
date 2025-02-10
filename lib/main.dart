import 'package:djangowithflutter/admin/add_product/bloc/add_product_bloc.dart';
import 'package:djangowithflutter/admin/product_details/admin_product_details_page.dart';
import 'package:djangowithflutter/home/view/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'core/router.dart';
import 'authenticaion/service/signup_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize authentication service
    // AuthService().login(password: "1234567890", username: "SALIQKT");

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => AddProductBloc()),
        // BlocProvider(create: (context) => ProductBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: router,
        // theme: lightTheme,
      ),
    );
  }
}
