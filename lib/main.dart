import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:machine_test_luminar/core/network_helper/network_check.dart';
import 'package:machine_test_luminar/db/model/user_details/user.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';

import 'db/hive_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Set clean URLs for web
  setPathUrlStrategy();

  //  Initialize NetworkService
  await Get.putAsync(() => NetworkService().init());

  //  Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsHiveAdapter());
  await Hive.openBox<UserDetailsHive>(DbKeys.userDetails);

  //  Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Machine Test',
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
