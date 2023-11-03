import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0F13),
      body: Center(
        child: Container(
          width: 342,
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
              bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
            ),
            color: Color(0xff1A1E24),
          ),
        ),
      ),
    );
  }
}
