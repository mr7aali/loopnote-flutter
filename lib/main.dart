import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const TaskLoopApp());
}

class TaskLoopApp extends StatelessWidget {
  const TaskLoopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskLoop',
      theme: AppTheme.light,
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
