import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';
import 'providers/charades_provider.dart';
import 'setup/charades_setup_screen.dart';
import 'game/charades_game_screen.dart';
import 'result/charades_result_screen.dart';

class CharadesScreen extends ConsumerWidget {
  const CharadesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(charadesProvider);
    
    return Scaffold(
      body: Navigator(
        pages: [
          // 설정 페이지
          const MaterialPage(
            key: ValueKey('setup'),
            child: CharadesSetupScreen(),
          ),
          
          // 게임 진행 페이지
          if (state.isGameActive)
            const MaterialPage(
              key: ValueKey('game'),
              child: CharadesGameScreen(),
            ),
          
          // 결과 페이지
          if (!state.isGameActive && state.words.isNotEmpty && state.currentWordIndex > 0)
            const MaterialPage(
              key: ValueKey('result'),
              child: CharadesResultScreen(),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          
          // 게임 상태에 따른 네비게이션 처리
          final currentState = ref.read(charadesProvider);
          if (currentState.isGameActive) {
            ref.read(charadesProvider.notifier).endGame();
          } else if (currentState.words.isNotEmpty) {
            ref.read(charadesProvider.notifier).resetGame();
          }
          
          return true;
        },
      ),
    );
  }
} 