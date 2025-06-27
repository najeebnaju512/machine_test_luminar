import 'package:flutter/material.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart' show GetMaterialApp;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set URL strategy for web
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
