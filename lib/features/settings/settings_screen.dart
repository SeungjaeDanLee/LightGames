import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('설정'),
        ),
        body: const Center(
          child: Text('설정 기능 준비 중...'),
        ),
      );
} 