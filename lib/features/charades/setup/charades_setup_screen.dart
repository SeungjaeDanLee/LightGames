import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/shared.dart';
import '../providers/charades_provider.dart';

class CharadesTopicSelectionScreen extends ConsumerStatefulWidget {
  const CharadesTopicSelectionScreen({super.key});

  @override
  ConsumerState<CharadesTopicSelectionScreen> createState() => _CharadesTopicSelectionScreenState();
}

class _CharadesTopicSelectionScreenState extends ConsumerState<CharadesTopicSelectionScreen> {
  List<String> topics = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTopics();
  }

  Future<void> _loadTopics() async {
    try {
      final jsonStr = await rootBundle.loadString('lib/data/charades_words.json');
      final data = json.decode(jsonStr) as Map<String, dynamic>;
      setState(() {
        topics = data.keys.toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(charadesProvider);
    
    if (isLoading) {
      return const Scaffold(
        appBar: null,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('주제 선택')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(24),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: topics.map((topic) {
          final isSelected = state.selectedTopic == topic;
          return GestureDetector(
            onTap: () {
              ref.read(charadesProvider.notifier).selectTopic(topic);
              Navigator.of(context).pop();
            },
            child: Card(
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              elevation: isSelected ? 8 : 2,
              child: Center(
                child: Text(
                  topic,
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

class CharadesSetupScreen extends ConsumerWidget {
  const CharadesSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(charadesProvider);
    final notifier = ref.read(charadesProvider.notifier);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          context.go('/');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('몸으로 말해요 설정'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            
            // 플레이어 수 설정
            PlayerCountSelector(
              currentCount: state.playerCount,
              onChanged: notifier.updatePlayerCount,
              title: '플레이어 수',
              minPlayers: 2,
              maxPlayers: 10,
            ),
            const SizedBox(height: 32),

            // 주제 선택
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CharadesTopicSelectionScreen(),
                  ),
                );
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
                  Text(
                    state.selectedTopic.isEmpty ? '주제 선택' : state.selectedTopic,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // 시간 제한 설정
            Text(
              '시간 제한',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('30초', style: TextStyle(color: Colors.grey)),
                Text(
                  '${state.timeLimit}초',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('180초', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Slider(
              value: state.timeLimit.toDouble(),
              min: 30,
              max: 180,
              divisions: 15,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (value) {
                notifier.updateTimeLimit(value.round());
              },
            ),
            const SizedBox(height: 32),
            
            
            
            if (state.error != null) ...[
              const SizedBox(height: 16),
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.error, color: Colors.red.shade700, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.error!,
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            
            const Spacer(),
            
            // 게임 시작 버튼
            Center(
              child: SizedBox(
                width: double.infinity,
                child: GamePrimaryButton(
                  text: state.isLoading ? '준비 중...' : '게임 시작',
                  onPressed: state.isLoading || state.selectedTopic.isEmpty 
                    ? null 
                    : () async {
                        await notifier.loadWords();
                        if (context.mounted && state.error == null) {
                          notifier.startGame();
                        }
                      },
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
} 