import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTransitionWrapper extends CustomTransitionPage {
  CustomTransitionWrapper({
    required super.child,
    required LocalKey super.key,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Offset beginOffset = const Offset(1.0, 0.0), // Slide from right
  }) : super(
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(parent: animation, curve: curve);
            return SlideTransition(
              position: Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(curved),
              child: child,
            );
          },
        );
}




Future<T?> pushWithTransition<T>(
  BuildContext context,
  Widget page, {
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
  Offset beginOffset = const Offset(1.0, 0.0), // Slide from right
}) {
  return Navigator.of(context).push<T>(
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    ),
  );
}
