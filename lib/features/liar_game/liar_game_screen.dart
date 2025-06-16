import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/index.dart';
import 'providers/liar_game_provider.dart';
import 'widgets/liar_game_setup_widget.dart';
import 'widgets/player_word_display_widget.dart';
import 'widgets/liar_game_discussion_widget.dart';
import 'package:go_router/go_router.dart';
import '../../shared/shared.dart';

class LiarGameScreen extends ConsumerWidget {
  const LiarGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liarGameProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('에러: $e')),
      data: (data) {
        if (!data.isGameStarted) {
          return LiarGameSetupWidget();
        }
        switch (data.step) {
          case 0:
            return PlayerWordDisplayWidget(); // 플레이어 단어 표시
          case 1:
            return LiarGameDiscussionWidget(); // 라이어 게임 토론
          case 2:
            return GameResultDialog(); // 게임 결과
          case 3:
            return PlayerSelectWidget(); // 플레이어 선택
          case 4:
            return PlayerRoleRevealWidget(); // 플레이어 정체 공개
          default:
            return const Center(child: Text('알 수 없는 단계'));
        }
      },
    );
  }
}

class GameResultDialog extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liarGameProvider).value!;
    final liarIdx = state.players.indexWhere((p) => p.role == LiarRole.liar);
    final foolIdx = state.players.indexWhere((p) => p.role == LiarRole.fool);
    final spyIdx = state.players.indexWhere((p) => p.role == LiarRole.spy);
    final List<Widget> roleInfo = [];
    if (liarIdx != -1) {
      roleInfo.add(Text('라이어: 플레이어 ${liarIdx + 1}', style: const TextStyle(fontSize: 18)));
    }
    if (spyIdx != -1) {
      roleInfo.add(Text('스파이: 플레이어 ${spyIdx + 1}', style: const TextStyle(fontSize: 18)));
    }
    if (foolIdx != -1) {
      roleInfo.add(Text('바보: 플레이어 ${foolIdx + 1}', style: const TextStyle(fontSize: 18)));
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('게임 결과'),
        actions: const [SettingsButton()],
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 8,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const GameSectionTitle(
                  '🎉 토론 종료!!',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                GamePrimaryButton(
                  text: '확인',
                  icon: Icons.check,
                  onPressed: () {
                    ref.read(liarGameProvider.notifier).goToSelect();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerSelectWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liarGameProvider).value!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('플레이어 선택'),
        actions: const [SettingsButton()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const GameSectionTitle('🤔 라이어(또는 바보)로 의심되는 플레이어를 선택하세요!'),
            const SizedBox(height: 24),
            ...List.generate(state.players.length, (idx) => GameCard(
              onTap: () => ref.read(liarGameProvider.notifier).selectPlayer(idx),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '플레이어 ${idx + 1}', 
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

String roleToKorean(LiarRole role) {
  switch (role) {
    case LiarRole.liar:
      return '라이어';
    case LiarRole.citizen:
      return '시민';
    case LiarRole.spy:
      return '스파이';
    case LiarRole.fool:
      return '바보';
  }
}

class PlayerRoleRevealWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(liarGameProvider).value!;
    final player = state.selectedPlayer;
    if (player == null) return const Center(child: Text('플레이어를 선택하세요'));
    final playerNumber = state.players.indexOf(player) + 1;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('정체 공개'),
        actions: const [SettingsButton()],
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 8,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 320, maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const GameSectionTitle(
                    '🔍 정체 공개',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Text('플레이어 $playerNumber', style: const TextStyle(fontSize: 32), textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  Text('정체: ${roleToKorean(player.role)}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  const SizedBox(height: 32),
                  GamePrimaryButton(
                    text: '게임 리셋',
                    icon: Icons.refresh,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                    onPressed: () => ref.read(liarGameProvider.notifier).resetGame(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8),
        child: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (_) => const SettingsDialog(),
            );
          },
        ),
      ),
    );
  }
}

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('설정'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('브금'),
            trailing: Switch(
              value: false, // TODO: 상태 연결
              onChanged: (v) {},
            ),
          ),
          ListTile(
            title: const Text('화면 흑백 반전'),
            trailing: Switch(
              value: false, // TODO: 상태 연결
              onChanged: (v) {},
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.home),
            label: const Text('홈으로 가기'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              ref.read(liarGameProvider.notifier).resetGame();
              Navigator.of(context).pop();
              context.go('/');
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('닫기'),
        ),
      ],
    );
  }
} 