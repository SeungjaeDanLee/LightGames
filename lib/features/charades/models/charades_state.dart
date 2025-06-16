import 'package:freezed_annotation/freezed_annotation.dart';

part 'charades_state.freezed.dart';

@freezed
class CharadesState with _$CharadesState {
  const factory CharadesState({
    @Default(4) int playerCount,
    @Default(60) int timeLimit,
    @Default('') String selectedTopic,
    @Default([]) List<String> words,
    @Default(0) int currentWordIndex,
    @Default(0) int correctCount,
    @Default(false) bool isGameActive,
    @Default(false) bool isLoading,
    String? error,
  }) = _CharadesState;
} 