import 'dart:math';

class GameUtils {
  static final Random _random = Random();

  /// 리스트를 셔플하여 새로운 리스트를 반환
  static List<T> shuffleList<T>(List<T> list) {
    final shuffled = List<T>.from(list);
    shuffled.shuffle(_random);
    return shuffled;
  }

  /// 리스트에서 랜덤한 요소 하나를 선택
  static T getRandomElement<T>(List<T> list) {
    if (list.isEmpty) {
      throw ArgumentError('리스트가 비어있습니다.');
    }
    return list[_random.nextInt(list.length)];
  }

  /// 리스트에서 중복 없이 n개의 랜덤 요소를 선택
  static List<T> getRandomElements<T>(List<T> list, int count) {
    if (count > list.length) {
      throw ArgumentError('선택할 개수가 리스트 크기보다 큽니다.');
    }
    final shuffled = shuffleList(list);
    return shuffled.take(count).toList();
  }

  /// 플레이어 목록을 생성 (플레이어 1, 플레이어 2, ...)
  static List<String> generatePlayerNames(int count) {
    return List.generate(count, (index) => '플레이어 ${index + 1}');
  }

  /// 분을 mm:ss 형식으로 변환
  static String formatMinutesToTime(int minutes) {
    return '${minutes.toString().padLeft(2, '0')}:00';
  }

  /// 초를 mm:ss 형식으로 변환
  static String formatSecondsToTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  /// 범위 내의 랜덤 정수 생성
  static int getRandomInt(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }

  /// 확률에 따른 boolean 반환 (0.0 ~ 1.0)
  static bool getRandomBool([double probability = 0.5]) {
    return _random.nextDouble() < probability;
  }

  /// 카테고리별 단어 로딩을 위한 JSON 파일 경로 생성
  static String getWordDataPath(String gameName, String category) {
    return 'lib/data/${gameName}_words.json';
  }

  /// 게임 타입에 따른 아이콘 반환
  static Map<String, dynamic> getGameIcon(String gameType) {
    switch (gameType.toLowerCase()) {
      case 'liar':
        return {'icon': '🕵️', 'name': '라이어 게임'};
      case 'charades':
        return {'icon': '🎭', 'name': '몸으로 말해요'};
      case 'mafia':
        return {'icon': '🌙', 'name': '마피아 게임'};
      default:
        return {'icon': '🎮', 'name': '게임'};
    }
  }
} 