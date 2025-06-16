import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/charades_state.dart';

part 'charades_provider.g.dart';

@riverpod
class Charades extends _$Charades {
  @override
  CharadesState build() {
    return const CharadesState();
  }

  void updatePlayerCount(int count) {
    state = state.copyWith(playerCount: count);
  }

  void updateTimeLimit(int seconds) {
    state = state.copyWith(timeLimit: seconds);
  }

  void selectTopic(String topic) {
    state = state.copyWith(selectedTopic: topic);
  }

  Future<void> loadWords() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      final String jsonString = await rootBundle.loadString('lib/data/charades_words.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      final List<String> topicWords = List<String>.from(jsonData[state.selectedTopic] ?? []);
      
      if (topicWords.isEmpty) {
        throw Exception('선택한 주제에 단어가 없습니다.');
      }
      
      // 단어 순서를 섞어서 저장
      final shuffledWords = List<String>.from(topicWords)..shuffle(math.Random());
      
      state = state.copyWith(
        words: shuffledWords,
        currentWordIndex: 0,
        correctCount: 0,
        isLoading: false,
      );
      
      log('단어 로딩 완료: ${shuffledWords.length}개');
    } catch (e) {
      log('단어 로딩 실패: $e');
      state = state.copyWith(
        isLoading: false,
        error: '단어를 불러오는데 실패했습니다: $e',
      );
    }
  }

  void startGame() {
    if (state.words.isEmpty) {
      state = state.copyWith(error: '먼저 단어를 로딩해주세요.');
      return;
    }
    
    state = state.copyWith(
      isGameActive: true,
      currentWordIndex: 0,
      correctCount: 0,
      error: null,
    );
  }

  void correctAnswer() {
    if (!state.isGameActive) return;
    
    final newCorrectCount = state.correctCount + 1;
    final newWordIndex = state.currentWordIndex + 1;
    
    if (newWordIndex >= state.words.length) {
      // 모든 단어를 다 했으면 게임 종료
      state = state.copyWith(
        correctCount: newCorrectCount,
        isGameActive: false,
      );
    } else {
      state = state.copyWith(
        correctCount: newCorrectCount,
        currentWordIndex: newWordIndex,
      );
    }
  }

  void skipWord() {
    if (!state.isGameActive) return;
    
    final newWordIndex = state.currentWordIndex + 1;
    
    if (newWordIndex >= state.words.length) {
      // 모든 단어를 다 했으면 게임 종료
      state = state.copyWith(isGameActive: false);
    } else {
      state = state.copyWith(currentWordIndex: newWordIndex);
    }
  }

  void endGame() {
    state = state.copyWith(isGameActive: false);
  }

  void resetGame() {
    state = const CharadesState();
  }

  String get currentWord {
    if (state.words.isEmpty || state.currentWordIndex >= state.words.length) {
      return '';
    }
    return state.words[state.currentWordIndex];
  }

  int get remainingWords {
    return math.max(0, state.words.length - state.currentWordIndex);
  }
} 