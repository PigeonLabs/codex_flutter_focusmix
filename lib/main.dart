import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const FocusMixApp());
}

/// Root widget for FocusMix application.
class FocusMixApp extends StatelessWidget {
  const FocusMixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusMix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: HomeScreen(),
    );
  }
}

