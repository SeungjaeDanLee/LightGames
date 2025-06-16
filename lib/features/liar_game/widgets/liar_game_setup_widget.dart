import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/index.dart';
import '../providers/liar_game_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../shared/shared.dart';

class LiarGameSetupWidget extends ConsumerStatefulWidget {
  const LiarGameSetupWidget({super.key});

  @override
  ConsumerState<LiarGameSetupWidget> createState() => _LiarGameSetupWidgetState();
}

class _LiarGameSetupWidgetState extends ConsumerState<LiarGameSetupWidget> {
  int playerCount = 4;
  LiarGameMode mode = LiarGameMode.normal;
  String? category;
  int timerMinutes = 3;
  Map<String, dynamic> wordDecks = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWordDecks();
  }

  Future<void> _loadWordDecks() async {
    final jsonStr = await rootBundle.loadString('lib/data/liar_game_words.json');
    final data = json.decode(jsonStr) as Map<String, dynamic>;
    setState(() {
      wordDecks = data;
      category = data.keys.first;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('라이어 게임 설정'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            PlayerCountSelector(
              currentCount: playerCount,
              onChanged: (count) => setState(() => playerCount = count),
              title: '플레이어 수',
            ),
            const SizedBox(height: 24),
            const GameSectionTitle(
              '모드 선택',
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                RadioListTile<LiarGameMode>(
                  value: LiarGameMode.normal,
                  groupValue: mode,
                  onChanged: (v) => setState(() => mode = v!),
                  title: const Text('일반 모드'),
                  subtitle: const Text('1명 라이어, 나머지 동일 단어'),
                ),
                RadioListTile<LiarGameMode>(
                  value: LiarGameMode.spy,
                  groupValue: mode,
                  onChanged: (v) => setState(() => mode = v!),
                  title: const Text('스파이 모드'),
                  subtitle: const Text('1명 라이어, 1명 스파이(다른 단어)'),
                ),
                RadioListTile<LiarGameMode>(
                  value: LiarGameMode.fool,
                  groupValue: mode,
                  onChanged: (v) => setState(() => mode = v!),
                  title: const Text('바보 모드'),
                  subtitle: const Text('1명 바보(다른 단어)'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                final selected = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategorySelectScreen(
                      categories: wordDecks.keys.toList(),
                      selected: category,
                    ),
                  ),
                );
                if (selected != null) setState(() => category = selected);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '주제',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 16),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      category ?? '주제 선택',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '토론 타이머',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('1분', style: TextStyle(color: Colors.grey)),
                Text(
                  '$timerMinutes분',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('10분', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Slider(
              value: timerMinutes.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (value) {
                setState(() => timerMinutes = value.round());
              },
            ),
            const SizedBox(height: 32),
            GamePrimaryButton(
              text: '게임 시작',
              onPressed: category == null
                  ? null
                  : () async {
                  await ref.read(liarGameProvider.notifier).setSettings(
                    LiarGameSettings(
                      playerCount: playerCount,
                      mode: mode,
                      category: category!,
                      timerMinutes: timerMinutes,
                    ),
                  );
                      ref.read(liarGameProvider.notifier).startGame();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySelectScreen extends StatelessWidget {
  final List<String> categories;
  final String? selected;
  const CategorySelectScreen({required this.categories, this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('주제 선택')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(24),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: categories.map((cat) {
          final isSelected = selected == cat;
          return GestureDetector(
            onTap: () => Navigator.pop(context, cat),
            child: Card(
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              elevation: isSelected ? 8 : 2,
              child: Center(
                child: Text(
                  cat,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey[800],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
} 