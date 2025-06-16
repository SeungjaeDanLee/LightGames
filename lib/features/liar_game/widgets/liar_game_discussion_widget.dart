import 'dart:async';
import '../models/index.dart';
import '../providers/liar_game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../liar_game_screen.dart';

class LiarGameDiscussionWidget extends ConsumerStatefulWidget {
  const LiarGameDiscussionWidget({super.key});

  @override
  ConsumerState<LiarGameDiscussionWidget> createState() => _LiarGameDiscussionWidgetState();
}

class _LiarGameDiscussionWidgetState extends ConsumerState<LiarGameDiscussionWidget> {
  int? secondsLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(liarGameProvider).value!;
      setState(() {
        secondsLeft = state.timerMinutes * 60;
      });
      _startTimer();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft == null) return;
      if (secondsLeft! > 0) {
        setState(() => secondsLeft = secondsLeft! - 1);
      } else {
        timer.cancel();
        ref.read(liarGameProvider.notifier).goToResult();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(liarGameProvider).value!;
    final minutes = (secondsLeft ?? state.timerMinutes * 60) ~/ 60;
    final seconds = (secondsLeft ?? state.timerMinutes * 60) % 60;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('토론 타이머'),
        actions: const [SettingsButton()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle(context, '🗣️ 모두 확인 완료! 이제 토론을 시작하세요!'),
            const SizedBox(height: 32),
            Center(
              child: Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.flag),
              label: const Text('토론 종료'),
              onPressed: () => ref.read(liarGameProvider.notifier).goToResult(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('게임 리셋'),
              onPressed: () => ref.read(liarGameProvider.notifier).resetGame(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
} 