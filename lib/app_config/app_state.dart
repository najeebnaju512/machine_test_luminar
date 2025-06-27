import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_luminar/router/routes/app_routes.dart';

///Global Route Instanse
final AppRouteState appRouteState = AppRouteState();

///Route State Manager
class AppRouteState extends ChangeNotifier {
  AppRouteState() {
    init();
  }

  AppStatus get appStatus => _appStatus;
  AppStatus _appStatus = AppStatus.unAuthenticated;
  bool get isUserLoggedIn => _appStatus == AppStatus.authenticated;
  String get fullPath => _fullPath;
  String _fullPath = '';
  void init() async {
    // devPrint("App Route State Initalized", type: PrintType.success);
    // UserDetailsHive? user = GetHiveHelper.getUserDetails();

    // if (user == null) {
    //   // devPrint("Not Authenticated", type: PrintType.success);

    //   _appStatus = AppStatus.unAuthenticated;
    // } else {
    // devPrint(" Authenticated", type: PrintType.success);
    _appStatus = AppStatus.authenticated;
    // }
  }

  ///Sets the app status to authenticated
  void logIn() {
    _appStatus = AppStatus.authenticated;
    notifyListeners();
  }

  ///Logs out the user by setting the app status to unauthenticated and notifying listeners
  void logout() {
    // HiveHelper.getUserDetailsHiveBox().clear();
    _appStatus = AppStatus.unAuthenticated;
    notifyListeners();
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    // devPrint('State.fullpath = ${state.fullPath} ');
    _fullPath = state.fullPath ?? '';
    if (_appStatus == AppStatus.unAuthenticated) {
      return AppRoutes.loginPath;
    } else {
      if (state.fullPath == "/" ||
          state.fullPath == AppRoutes.loginPath ||
          state.fullPath == AppRoutes.auth) {
        return '/authenticated/home';
      }
    }
    return null;
  }
}

enum AppStatus { authenticated, initial, unAuthenticated, network }
