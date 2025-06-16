import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/index.dart';
import '../providers/liar_game_provider.dart';
import '../liar_game_screen.dart';

class PlayerWordDisplayWidget extends ConsumerStatefulWidget {
  const PlayerWordDisplayWidget({super.key});

  @override
  ConsumerState<PlayerWordDisplayWidget> createState() => _PlayerWordDisplayWidgetState();
}

class _PlayerWordDisplayWidgetState extends ConsumerState<PlayerWordDisplayWidget> {
  bool isRevealed = true;

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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(liarGameProvider).value!;
    final player = state.players[state.currentPlayerIndex];
    final isLast = state.currentPlayerIndex == state.players.length - 1;
    final isLiar = player.role == LiarRole.liar;
    final isSpy = player.role == LiarRole.spy;
    final isFool = player.role == LiarRole.fool;
    Color bgColor = Colors.white;
    String roleText;
    if (isLiar) {
      roleText = '🤫 당신은 라이어입니다!';
    } else {
      roleText = '🔑 단어';
    }

    if (!isRevealed) {
      // 단어/역할 가림 화면
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  _buildSectionTitle(context, '📱 다음 플레이어에게 스마트폰을 전달하세요!'),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(() => isRevealed = true);
                      ref.read(liarGameProvider.notifier).nextPlayer();
                    },
                    label: const Text('확인'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    // 단어/역할 보여주는 기존 화면
    return Scaffold(
      appBar: AppBar(
        title: const Text('라이어 게임'),
        actions: const [SettingsButton()],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle(context, '🙋‍♂️  ${state.currentPlayerIndex + 1}번 플레이어님, 휴대폰을 받으세요!'),
            const SizedBox(height: 32),
            Text(
              roleText,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (player.word != null)
              Column(
                children: [
                  Text(
                    player.word!,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (isSpy)
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        '🕵️‍♂️ 당신은 스파이입니다.',
                        style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 32),
            Text(
              isLast
                  ? '모든 플레이어가 확인을 마쳤습니다.'
                  : '확인 후 스마트폰을 다음 플레이어에게 넘겨주세요.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(isLast ? Icons.check : Icons.arrow_forward),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() => isRevealed = false);
              },
              label: Text(isLast ? '확인 완료' : '다음'),
            ),
          ],
        ),
      ),
    );
  }
} 