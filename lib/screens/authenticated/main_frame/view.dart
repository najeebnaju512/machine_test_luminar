import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/core/network_helper/network_check.dart';
import 'package:machine_test_luminar/core/tag_helper/teg_generator.dart';
import 'package:machine_test_luminar/screens/authenticated/main_frame/controller.dart';
import 'package:machine_test_luminar/widget/screens/no_network.dart';

class AuthenticatedFrame extends StatefulWidget {
  final Widget child;
  const AuthenticatedFrame({super.key, required this.child});

  @override
  State<AuthenticatedFrame> createState() => _AuthenticatedFrameState();
}

class _AuthenticatedFrameState extends State<AuthenticatedFrame> {
  late MainFrameController controller;

  final String tag = fnTagGenerator();
  // Mapping indexes to route names
  @override
  void initState() {
    controller = Get.put(MainFrameController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<MainFrameController>(tag: tag);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Sync the current index based on the route
    // controller.routeListner();
  }

 @override
Widget build(BuildContext context) {
  final isConnected = Get.find<NetworkService>().isConnected;

  return Obx(() {
    return Scaffold(
      body: isConnected.value
          ? widget.child
          : const NoNetworkScreen(), // Offline screen
      bottomNavigationBar: isConnected.value
          ? BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (value) {
                controller.onTap(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Leads'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            )
          : null, // Hide bottom nav if offline
    );
  });
}

}
