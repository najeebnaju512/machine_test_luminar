import 'package:go_router/go_router.dart';
import 'package:machine_test_luminar/app_config/app_state.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:machine_test_luminar/router/transition/transition.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/details/view.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/view.dart';
import 'package:machine_test_luminar/screens/authenticated/main_frame/view.dart';
import 'package:machine_test_luminar/screens/authenticated/profile_view/view.dart';
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
      pageBuilder: (context, state) => CustomTransitionWrapper(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
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
  static const String leaddetails = '/lead_details/:id';
  static const String profilePath = '/profile';
  static const String home = 'lead_list';
  static const String lead = 'lead';
  static const String profile = 'profile';

  static final List<RouteBase> routes = [
    GoRoute(
      path: homePath,
      name: home,
      pageBuilder: (context, state) => CustomTransitionWrapper(
        key: state.pageKey,
        child: const LeadListScreen(),
      ),
    ),
    GoRoute(
      path: leaddetails,
      name: lead,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'];
        return CustomTransitionWrapper(
          key: state.pageKey,
          child: LeadDetailPage(id: id!),
        );
      },
    ),
    GoRoute(
      path: profilePath,
      name: profile,
      pageBuilder: (context, state) => CustomTransitionWrapper(
        key: state.pageKey,
        child: const ProfileScreen(),
      ),
    ),
  ];
}
