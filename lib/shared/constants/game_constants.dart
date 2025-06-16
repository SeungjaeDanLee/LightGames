import 'package:flutter/material.dart';

class GameConstants {
  // 플레이어 수 제한
  static const int minPlayers = 3;
  static const int maxPlayers = 10;
  static const int defaultPlayers = 5;

  // 타이머 설정 (분)
  static const List<int> timerOptions = [1, 2, 3, 5, 10];
  static const int defaultTimerMinutes = 3;

  // UI 상수
  static const double cardBorderRadius = 12.0;
  static const double buttonBorderRadius = 8.0;
  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(12.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(vertical: 20.0);

  // 애니메이션 지속시간
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // 텍스트 스타일 크기
  static const double titleFontSize = 24.0;
  static const double headlineFontSize = 20.0;
  static const double bodyFontSize = 16.0;
  static const double captionFontSize = 14.0;

  // 게임별 색상 테마
  static const Map<String, Color> gameColors = {
    'liar': Colors.red,
    'charades': Colors.blue,
    'mafia': Colors.purple,
    'default': Colors.green,
  };

  // 아이콘 크기
  static const double smallIconSize = 16.0;
  static const double mediumIconSize = 24.0;
  static const double largeIconSize = 32.0;
  static const double extraLargeIconSize = 48.0;

  // 스페이싱
  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 16.0;
  static const double largeSpacing = 24.0;
  static const double extraLargeSpacing = 32.0;

  // 그림자
  static const double cardElevation = 2.0;
  static const double buttonElevation = 1.0;

  // 게임 상태
  static const String gameStateSetup = 'setup';
  static const String gameStatePlaying = 'playing';
  static const String gameStateResult = 'result';
  static const String gameStatePaused = 'paused';

  // 경고 시간 (초)
  static const int warningTimeSeconds = 30;
  static const int criticalTimeSeconds = 10;

  // 에러 메시지
  static const String errorLoadingData = '데이터를 불러오는 중 오류가 발생했습니다.';
  static const String errorInvalidPlayerCount = '플레이어 수가 유효하지 않습니다.';
  static const String errorGameNotFound = '게임을 찾을 수 없습니다.';

  // 성공 메시지
  static const String successGameComplete = '게임이 완료되었습니다!';
  static const String successDataLoaded = '데이터가 성공적으로 로드되었습니다.';
} 