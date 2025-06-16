import 'package:freezed_annotation/freezed_annotation.dart';

part 'liar_game_models.freezed.dart';

enum LiarGameMode { normal, spy, fool }
enum LiarRole { liar, spy, fool, citizen }

@freezed
class LiarPlayer with _$LiarPlayer {
  const factory LiarPlayer({
    required String name,
    required LiarRole role,
    String? word,
  }) = _LiarPlayer;
}

@freezed
class LiarGameSettings with _$LiarGameSettings {
  const factory LiarGameSettings({
    required int playerCount,
    required LiarGameMode mode,
    required String category,
    required int timerMinutes,
  }) = _LiarGameSettings;
}

@freezed
class LiarGameState with _$LiarGameState {
  const factory LiarGameState({
    required int playerCount,
    required LiarGameMode mode,
    required List<String> wordDeck,
    required List<LiarPlayer> players,
    required int currentPlayerIndex,
    required bool isGameStarted,
    required int timerMinutes,
    required int step,
    int? selectedPlayer,
    String? error,
  }) = _LiarGameState;
} 