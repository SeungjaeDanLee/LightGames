import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/index.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'liar_game_provider.freezed.dart';

@freezed
class LiarGameState with _$LiarGameState {
  const factory LiarGameState({
    @Default(3) int playerCount,
    @Default(LiarGameMode.normal) LiarGameMode mode,
    @Default([]) List<String> wordDeck,
    @Default([]) List<LiarPlayer> players,
    @Default(0) int currentPlayerIndex,
    @Default(false) bool isGameStarted,
    @Default(3) int timerMinutes,
    @Default(0) int step,
    @Default(null) LiarPlayer? selectedPlayer,
    @Default(null) String? error,
  }) = _LiarGameState;
}

class LiarGameNotifier extends AsyncNotifier<LiarGameState> {
  LiarGameSettings? _settings;
  Map<String, dynamic>? _wordData;

  @override
  Future<LiarGameState> build() async {
    return const LiarGameState(
      playerCount: 3,
      mode: LiarGameMode.normal,
      wordDeck: [],
      players: [],
      currentPlayerIndex: 0,
      isGameStarted: false,
      timerMinutes: 3,
      step: 0,
      selectedPlayer: null,
      error: null,
    );
  }

  Future<void> loadWordData() async {
    final jsonStr = await rootBundle.loadString('lib/data/liar_game_words.json');
    _wordData = json.decode(jsonStr) as Map<String, dynamic>;
  }

  Future<void> setSettings(LiarGameSettings settings) async {
    _settings = settings;
    await loadWordData();
    state = AsyncValue.data(
      state.value!.copyWith(
        playerCount: settings.playerCount,
        mode: settings.mode,
        timerMinutes: settings.timerMinutes,
        step: 0,
        selectedPlayer: null,
      ),
    );
  }

  Future<void> startGame() async {
    if (_settings == null || _wordData == null) {
      state = AsyncValue.error('설정 또는 단어 데이터가 없습니다', StackTrace.current);
      return;
    }
    final category = _settings!.category;
    if (!_wordData!.containsKey(category)) {
      state = AsyncValue.error('카테고리 없음: $category', StackTrace.current);
      return;
    }
    final words = _wordData![category];
    if (words == null || words is! Map<String, dynamic>) {
      state = AsyncValue.error('카테고리 데이터가 잘못됨: $category', StackTrace.current);
      return;
    }
    final normalWords = List<String>.from(words['normal'] ?? []);
    final foolWords = List<String>.from(words['fool'] ?? []);
    if (normalWords.isEmpty) {
      state = AsyncValue.error('단어 리스트가 비어있습니다', StackTrace.current);
      return;
    }
    final mode = _settings!.mode;
    final playerCount = _settings!.playerCount;
    final timerMinutes = _settings!.timerMinutes;
    final random = Random();
    final word = (normalWords..shuffle(random)).first;
    final foolWord = (foolWords..shuffle(random)).first;
    // 역할 분배
    final roles = <LiarRole>[];
    switch (mode) {
      case LiarGameMode.normal:
        roles.add(LiarRole.liar);
        roles.addAll(List.filled(playerCount - 1, LiarRole.citizen));
        break;
      case LiarGameMode.spy:
        roles.add(LiarRole.liar);
        roles.add(LiarRole.spy);
        roles.addAll(List.filled(playerCount - 2, LiarRole.citizen));
        break;
      case LiarGameMode.fool:
        roles.add(LiarRole.fool);
        roles.addAll(List.filled(playerCount - 1, LiarRole.citizen));
        break;
    }
    roles.shuffle(random);
    final players = <LiarPlayer>[];
    for (var i = 0; i < playerCount; i++) {
      final role = roles[i];
      String? playerWord;
      switch (role) {
        case LiarRole.liar:
          playerWord = null;
          break;
        case LiarRole.spy:
          playerWord = word + ' (스파이)';
          break;
        case LiarRole.fool:
          playerWord = foolWord;
          break;
        case LiarRole.citizen:
          playerWord = word;
          break;
      }
      players.add(LiarPlayer(name: '플레이어 ${i + 1}', role: role, word: playerWord));
    }
    state = AsyncValue.data(
      state.value!.copyWith(
        wordDeck: normalWords,
        players: players,
        currentPlayerIndex: 0,
        isGameStarted: true,
        timerMinutes: timerMinutes,
        step: 0,
        selectedPlayer: null,
        error: null,
      ),
    );
  }

  void nextPlayer() {
    final current = state.value!.currentPlayerIndex;
    if (current < state.value!.players.length - 1) {
      state = AsyncValue.data(
        state.value!.copyWith(currentPlayerIndex: current + 1),
      );
    } else {
      // 마지막 플레이어까지 확인하면 step=1(토론)로 전환
      state = AsyncValue.data(
        state.value!.copyWith(step: 1),
      );
    }
  }

  void goToResult() {
    state = AsyncValue.data(state.value!.copyWith(step: 2));
  }

  void goToSelect() {
    state = AsyncValue.data(state.value!.copyWith(step: 3));
  }

  void selectPlayer(int index) {
    final player = state.value!.players[index];
    state = AsyncValue.data(state.value!.copyWith(selectedPlayer: player, step: 4));
  }

  void resetGame() {
    _settings = null;
    _wordData = null;
    state = AsyncValue.data(
      state.value!.copyWith(
        players: [],
        currentPlayerIndex: 0,
        isGameStarted: false,
        timerMinutes: 3,
        step: 0,
        selectedPlayer: null,
        error: null,
      ),
    );
  }
}

final liarGameProvider = AsyncNotifierProvider<LiarGameNotifier, LiarGameState>(
  LiarGameNotifier.new,
); 