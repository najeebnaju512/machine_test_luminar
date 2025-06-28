import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:machine_test_luminar/db/model/user_details/user.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart' show GetMaterialApp;

import 'db/hive_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set URL strategy for web
  setPathUrlStrategy();

  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsHiveAdapter());
  await Hive.openBox<UserDetailsHive>(DbKeys.userDetails);

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
