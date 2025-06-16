# 🎮 Light Games - 나들이용 오프라인 파티 게임

> Flutter로 구축된 모바일 친화적 오프라인 파티 게임 컬렉션

## 📋 프로젝트 개요

Light Games는 친구들과 함께 즐길 수 있는 오프라인 파티 게임들을 모은 Flutter 앱입니다. 인터넷 연결 없이도 언제 어디서나 즐길 수 있으며, 직관적인 UI와 모던한 디자인으로 모든 연령대가 쉽게 사용할 수 있습니다.

### 🎯 주요 특징

- **오프라인 완전 지원**: 인터넷 연결 없이도 모든 기능 이용 가능
- **모바일 최적화**: 터치 친화적 UI와 반응형 디자인
- **일관된 UX**: 모든 게임에서 통일된 사용자 경험
- **확장 가능한 구조**: 새로운 게임 추가가 용이한 아키텍처
- **현대적 디자인**: Material Design 3 기반의 세련된 UI

## 🎮 게임 목록

### 1. 몸으로 말해요 (Charades)
몸짓으로 단어를 표현하고 맞추는 클래식 게임
- **플레이어**: 2-10명
- **시간 제한**: 30-180초 (조절 가능)
- **주제**: 음식, 동물, 장소, 영화, 직업, 스포츠, 과일, 게임 등 (추가 가능)
- **기능**: 실시간 타이머, 점수 시스템, 단어 스킵/정답 처리

### 2. 라이어 게임 (Liar Game)
한 명의 라이어를 찾아내는 추리 게임
- **플레이어**: 3-10명
- **시간 제한**: 1-10분 (조절 가능)
- **카테고리**: 음식, 동물, 장소, 영화, 직업, 스포츠, 과일, 게임, 유명인, 브랜드 등 (추가 가능)
- **기능**: 라이어 배정, 키워드 공개, 토론 타이머

## 🛠 기술 스택

### 프레임워크 & 언어
- **Flutter** 3.7.2+ - 크로스 플랫폼 UI 프레임워크
- **Dart** - 프로그래밍 언어

### 상태 관리 & 아키텍처
- **Riverpod** 2.5.1 - 반응형 상태 관리
- **Riverpod Annotation** 2.3.5 - 코드 생성 기반 프로바이더
- **Freezed** 2.4.5 - 불변 모델 클래스 생성

### 네비게이션 & 라우팅
- **GoRouter** 13.2.2 - 선언적 라우팅

### 데이터 처리
- **JSON Annotation** 4.8.1 - JSON 직렬화
- **JSON Serializable** 6.7.1 - JSON 코드 생성

### 개발 도구
- **Build Runner** 2.4.6 - 코드 생성 도구
- **Flutter Lints** 3.0.1 - 코드 품질 관리

### UI 라이브러리 (선택적)
- **Google Fonts** - 커스텀 폰트
- **Lottie** - 애니메이션
- **Flutter SVG** - SVG 지원
- **Flutter Animate** - 고급 애니메이션

## 📁 프로젝트 구조

```
lib/
├── main.dart                 # 앱 진입점
├── app.dart                  # 앱 설정 및 라우팅
├── core/                     # 핵심 유틸리티
├── data/                     # 게임 데이터 (JSON)
│   ├── charades_words.json   # 몸으로 말해요 단어 데이터
│   └── liar_game_words.json  # 라이어 게임 단어 데이터
├── features/                 # Feature-First 아키텍처
│   ├── home/                 # 홈 화면
│   │   └── home_screen.dart
│   ├── charades/             # 몸으로 말해요 게임
│   │   ├── charades_screen.dart
│   │   ├── models/           # 상태 모델
│   │   ├── providers/        # Riverpod 프로바이더
│   │   ├── setup/           # 게임 설정 화면
│   │   ├── game/            # 게임 플레이 화면
│   │   └── result/          # 결과 화면
│   ├── liar_game/           # 라이어 게임
│   │   ├── liar_game_screen.dart
│   │   ├── models/
│   │   ├── providers/
│   │   └── widgets/
│   └── settings/            # 설정 화면
├── shared/                  # 공유 컴포넌트
│   ├── constants/           # 상수 정의
│   ├── widgets/             # 재사용 가능한 위젯
│   └── utils/               # 유틸리티 함수
└── theme/                   # 테마 및 스타일
    └── light_games_theme.dart
```

## 🚀 설치 및 실행

### 사전 요구사항
- Flutter 3.7.2 이상
- Dart 3.0 이상
- Android Studio / VS Code (Flutter 플러그인 설치)

### 설치 방법

```bash
# 1. 저장소 클론
git clone [repository-url]
cd light_games

# 2. 의존성 설치
flutter pub get

# 3. 코드 생성 (Freezed, Riverpod 등)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. 앱 실행
flutter run
```

### 빌드 방법

```bash
# Android APK 빌드
flutter build apk --release

# iOS 빌드 (macOS에서만)
flutter build ios --release

# 웹 빌드
flutter build web
```

## 🎮 게임별 상세 구현

### 몸으로 말해요 (Charades)

#### 데이터 구조
```json
{
  "음식": ["스파게티", "김치찌개", "햄버거", ...],
  "동물": ["강아지", "고양이", "코끼리", ...],
  "장소": ["학교", "병원", "도서관", ...]
}
```

#### 주요 화면 흐름
1. **설정 화면** → 플레이어 수, 주제, 시간 설정
2. **게임 화면** → 단어 표시, 타이머, 정답/패스 버튼
3. **결과 화면** → 점수 표시, 다시하기/홈으로 버튼

#### 핵심 기능
- JSON 파일에서 동적 주제/단어 로딩
- 실시간 카운트다운 타이머
- 점수 시스템 (정답/패스 구분)
- 게임 중 설정 변경 (설정 모달)

### 라이어 게임 (Liar Game)

#### 게임 로직
1. 플레이어 중 1명을 랜덤하게 라이어로 선택
2. 라이어를 제외한 모든 플레이어에게 동일한 키워드 제공
3. 라이어는 가짜 키워드를 받음
4. 토론 시간 동안 라이어 찾기

#### 주요 기능
- 라이어 랜덤 배정 시스템
- 키워드 표시/숨김 토글
- 플레이어별 역할 확인 UI
- 게임 재시작 기능

## 🏗 아키텍처 및 설계 원칙

### Feature-First 아키텍처
```
features/
├── [feature_name]/
│   ├── models/      # 데이터 모델 (Freezed 사용)
│   ├── providers/   # 상태 관리 (Riverpod)
│   ├── widgets/     # 피처별 위젯
│   └── screens/     # 화면 컴포넌트
```

### 상태 관리 패턴 (Riverpod)

#### 1. AsyncNotifierProvider 사용
```dart
@riverpod
class CharadesNotifier extends _$CharadesNotifier {
  @override
  CharadesState build() => const CharadesState();
  
  // 상태 변경 메서드들...
}
```

#### 2. Freezed 모델
```dart
@freezed
class CharadesState with _$CharadesState {
  const factory CharadesState({
    @Default(false) bool isGameActive,
    @Default(0) int playerCount,
    @Default([]) List<String> words,
    // 기타 상태들...
  }) = _CharadesState;
}
```

### 네비게이션 패턴 (GoRouter)
```dart
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/charades', builder: (context, state) => const CharadesScreen()),
    // 기타 라우트들...
  ],
);
```

## 🎨 UI/UX 디자인 시스템

### 컴포넌트 체계

#### 1. 게임 카드 (GameCard)
```dart
GameCard(
  title: '게임 제목',
  description: '게임 설명',
  icon: Icons.game_icon,
  onTap: () => context.go('/game_route'),
)
```

#### 2. 플레이어 수 선택기 (PlayerCountSelector)
- 슬라이더 기반 UI
- 최소/최대값 표시
- 현재 값 중앙 표시

#### 3. 게임 버튼 (GamePrimaryButton)
- 일관된 스타일링
- 로딩 상태 지원
- 비활성화 상태 처리

#### 4. 설정 모달 (ModalBottomSheet)
- 통일된 설정 UI
- 스위치 컴포넌트
- 홈으로 가기 버튼

### 색상 및 테마
- **Primary Color**: Material 3 기본 색상 시스템
- **Typography**: Material 3 텍스트 스타일
- **Elevation**: 카드와 버튼에 적절한 그림자 효과
- **Border Radius**: 16-32px의 라운드 코너

### 반응형 디자인
- **Padding**: 16-24px 기본, 화면 크기별 조정
- **Card Layout**: 가로 여백을 통한 콘텐츠 영역 조정
- **Button Size**: 터치하기 편한 최소 48px 높이

## 🔧 주요 컴포넌트

### 1. 타이머 시스템
```dart
class TimerWidget extends ConsumerStatefulWidget {
  // Timer 객체로 초 단위 카운트다운
  // 색상 변화 (30초 이하일 때 빨간색)
  // 시간 만료 시 자동 게임 종료
}
```

### 2. JSON 데이터 로더
```dart
Future<Map<String, List<String>>> loadGameData() async {
  final jsonStr = await rootBundle.loadString('lib/data/game_words.json');
  return json.decode(jsonStr);
}
```

### 3. 설정 지속성
```dart
// SharedPreferences를 통한 게임 설정 저장
class SettingsRepository {
  Future<void> savePlayerCount(int count) async { ... }
  Future<int> getPlayerCount() async { ... }
}
```

## 📦 새로운 게임 추가 가이드

### 1. 기본 구조 생성
```
lib/features/new_game/
├── new_game_screen.dart     # 메인 스크린
├── models/
│   ├── new_game_state.dart  # 상태 모델
│   └── new_game_state.freezed.dart
├── providers/
│   ├── new_game_provider.dart
│   └── new_game_provider.g.dart
└── widgets/
    └── game_specific_widgets.dart
```

### 2. 상태 모델 정의 (Freezed)
```dart
@freezed
class NewGameState with _$NewGameState {
  const factory NewGameState({
    @Default(false) bool isGameActive,
    @Default(2) int playerCount,
    // 게임별 고유 상태...
  }) = _NewGameState;
}
```

### 3. 프로바이더 구현 (Riverpod)
```dart
@riverpod
class NewGameNotifier extends _$NewGameNotifier {
  @override
  NewGameState build() => const NewGameState();
  
  void startGame() { /* 게임 시작 로직 */ }
  void endGame() { /* 게임 종료 로직 */ }
}
```

### 4. 라우트 추가
```dart
// app.dart에 새 라우트 추가
GoRoute(
  path: '/new_game',
  builder: (context, state) => const NewGameScreen(),
),
```

### 5. 홈 화면에 게임 카드 추가
```dart
GameCard(
  title: '새 게임',
  description: '게임 설명',
  icon: Icons.new_game_icon,
  onTap: () => context.go('/new_game'),
)
```

## 🔍 트러블슈팅

### 자주 발생하는 문제들

#### 1. 코드 생성 오류
```bash
# 해결방법: 기존 생성 파일 삭제 후 재생성
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

#### 2. 상태가 업데이트되지 않는 문제
- **원인**: Riverpod 프로바이더 잘못된 사용
- **해결**: `ref.read()` 대신 `ref.watch()` 사용
- **확인**: ConsumerWidget 상속 여부 체크

#### 3. JSON 로딩 실패
- **원인**: pubspec.yaml에 assets 경로 누락
- **해결**: `flutter:` → `assets:` 섹션에 JSON 파일 경로 추가

#### 4. 네비게이션 문제
- **원인**: `Navigator.pop()` vs `context.go()` 혼용
- **해결**: GoRouter 사용 시 일관되게 `context.go()` 사용

### 성능 최적화 팁

#### 1. 위젯 최적화
```dart
// const 생성자 사용
const GameCard(title: 'Game', ...);

// Consumer 범위 최소화
Consumer(builder: (context, ref, child) {
  final state = ref.watch(gameProvider);
  return Text(state.score.toString());
});
```

#### 2. 메모리 관리
```dart
// Timer 해제
@override
void dispose() {
  _timer?.cancel();
  super.dispose();
}

// 리스트 효율적 렌더링
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(...),
);
```

## 🚀 확장 계획

### 단기 목표
- [ ] 게임 통계 및 기록 기능
- [ ] 다크 테마 지원
- [ ] 접근성 개선 (TalkBack, Voice Over)
- [ ] 다국어 지원 (i18n)

### 중기 목표
- [ ] 새로운 게임 추가 (끝말잇기, 스무고개 등)
- [ ] 커스텀 단어/주제 추가 기능
- [ ] 게임 난이도 설정
- [ ] 사운드 효과 및 배경음악

### 장기 목표
- [ ] 멀티플레이어 온라인 모드
- [ ] 게임 방 생성/참여 시스템
- [ ] 리더보드 및 랭킹 시스템
- [ ] 소셜 기능 (친구 추가, 게임 공유)

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

> 이 README는 프로젝트 재구성을 위한 완전한 가이드를 제공합니다. 각 섹션의 코드 예제와 구조 설명을 참고하여 동일하거나 개선된 프로젝트를 구축할 수 있습니다.
