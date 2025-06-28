import 'package:flutter/material.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.wifi_off, size: 100, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Please check your network and try again.'),
        ],
      ),
    );
  }
}
