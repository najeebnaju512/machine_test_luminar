import 'package:go_router/go_router.dart';
import 'package:machine_test_luminar/app_config/app_state.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/view.dart';
import 'package:machine_test_luminar/screens/authenticated/main_frame/view.dart';
import 'package:machine_test_luminar/screens/un_authenticated/login/view.dart';

class AppRoutes {
  static const String loginPath = '/login';
  static const String login = 'login';
  static const String auth = '/authenticated';
  static const String authName = 'authenticatedPath';

  List<GoRoute> routes = [
    GoRoute(
      path: loginPath,
      name: login,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),

    GoRoute(
      redirect: appRouteState.redirect,
      path: AppRoutes.auth,
      name: AppRoutes.authName,
      routes: [
        ShellRoute(
          parentNavigatorKey: navKey,
          navigatorKey: shellRoutesKey,
          routes: Authenticated.routes,
          builder: (context, state, child) {
            return AuthenticatedFrame(child: child);
          },
        ),
      ],
    ),
  ];
}

class Authenticated {
  static const String homePath = '/lead_list';
  static const String home = 'lead_list';

  static final List<RouteBase> routes = [
    GoRoute(
      path: homePath,
      name: home,
      builder: (context, state) {
        return LeadListScreen();
      },
    ),
  ];
}
