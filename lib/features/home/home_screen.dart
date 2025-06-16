import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('오프라인 파티 게임'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GamePrimaryButton(
                text: '🕵️ 라이어 게임',
                onPressed: () => context.push('/liar'),
              ),
            ],
          ),
        ),
      );
} 