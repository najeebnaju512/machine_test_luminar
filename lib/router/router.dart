import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_luminar/app_config/app_state.dart';
import 'package:machine_test_luminar/router/routes/app_routes.dart';

GoRouter appRouter = GoRouter(
  routes: AppRoutes().routes,

  redirect: appRouteState.redirect,
  refreshListenable: appRouteState,
  navigatorKey: navKey,
  initialLocation: appRouteState.isUserLoggedIn
      ? '/authenticated/lead_list'
      : '/login',
);
GlobalKey<NavigatorState> navKey = GlobalKey();
GlobalKey<NavigatorState> shellRoutesKey = GlobalKey();
