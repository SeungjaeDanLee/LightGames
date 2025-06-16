import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFB74D)),
        useMaterial3: true,
        fontFamily: 'NotoSans',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      );
} 