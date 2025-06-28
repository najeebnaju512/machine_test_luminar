import 'package:flutter/material.dart';
import 'package:machine_test_luminar/router/router.dart';

void showGlobalSnackBar( {
  required String message,
  Color backgroundColor = Colors.redAccent,
  Duration duration = const Duration(seconds: 3),
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(navKey.currentContext!).clearSnackBars(); // optional: clear any existing snackbars

  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
    duration: duration,
    action: action,
  );

  ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(snackBar);
}
