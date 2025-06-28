import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:machine_test_luminar/router/routes/app_routes.dart';

class MainFrameController extends GetxController {
  final List<String> routes = [Authenticated.home, Authenticated.profile];

  RxInt currentIndex = 0.obs;

  void routeListner() {
    final location = GoRouterState.of(navKey.currentContext!).uri.toString();
    final index = routes.indexWhere((r) => location.startsWith(r));
    if (index != -1 && index != currentIndex.value) {
      currentIndex.value = index;
    }
    currentIndex.refresh();
  }

  void onTap(int value) {
    appRouter.goNamed(routes[value]);
    currentIndex.value = value;
  }

  @override
  void onInit() {
    // routeListner();
    super.onInit();
  }
}
