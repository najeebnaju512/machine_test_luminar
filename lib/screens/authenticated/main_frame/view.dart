import 'package:flutter/material.dart';

class AuthenticatedFrame extends StatefulWidget {
  final Widget child;
  const AuthenticatedFrame({super.key, required this.child});

  @override
  State<AuthenticatedFrame> createState() => _AuthenticatedFrameState();
}

class _AuthenticatedFrameState extends State<AuthenticatedFrame> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
