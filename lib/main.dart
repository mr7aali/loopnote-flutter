import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const LoopNoteApp());
}

class LoopNoteApp extends StatelessWidget {
  const LoopNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loop Note',
      theme: AppTheme.light,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
