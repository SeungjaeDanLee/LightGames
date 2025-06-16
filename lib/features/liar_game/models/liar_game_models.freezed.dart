// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liar_game_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LiarPlayer {
  String get name => throw _privateConstructorUsedError;
  LiarRole get role => throw _privateConstructorUsedError;
  String? get word => throw _privateConstructorUsedError;

  /// Create a copy of LiarPlayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiarPlayerCopyWith<LiarPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiarPlayerCopyWith<$Res> {
  factory $LiarPlayerCopyWith(
    LiarPlayer value,
    $Res Function(LiarPlayer) then,
  ) = _$LiarPlayerCopyWithImpl<$Res, LiarPlayer>;
  @useResult
  $Res call({String name, LiarRole role, String? word});
}

/// @nodoc
class _$LiarPlayerCopyWithImpl<$Res, $Val extends LiarPlayer>
    implements $LiarPlayerCopyWith<$Res> {
  _$LiarPlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiarPlayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? word = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            role:
                null == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as LiarRole,
            word:
                freezed == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiarPlayerImplCopyWith<$Res>
    implements $LiarPlayerCopyWith<$Res> {
  factory _$$LiarPlayerImplCopyWith(
    _$LiarPlayerImpl value,
    $Res Function(_$LiarPlayerImpl) then,
  ) = __$$LiarPlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, LiarRole role, String? word});
}

/// @nodoc
class __$$LiarPlayerImplCopyWithImpl<$Res>
    extends _$LiarPlayerCopyWithImpl<$Res, _$LiarPlayerImpl>
    implements _$$LiarPlayerImplCopyWith<$Res> {
  __$$LiarPlayerImplCopyWithImpl(
    _$LiarPlayerImpl _value,
    $Res Function(_$LiarPlayerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiarPlayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? word = freezed,
  }) {
    return _then(
      _$LiarPlayerImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        role:
            null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as LiarRole,
        word:
            freezed == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$LiarPlayerImpl implements _LiarPlayer {
  const _$LiarPlayerImpl({required this.name, required this.role, this.word});

  @override
  final String name;
  @override
  final LiarRole role;
  @override
  final String? word;

  @override
  String toString() {
    return 'LiarPlayer(name: $name, role: $role, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiarPlayerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.word, word) || other.word == word));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, role, word);

  /// Create a copy of LiarPlayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiarPlayerImplCopyWith<_$LiarPlayerImpl> get copyWith =>
      __$$LiarPlayerImplCopyWithImpl<_$LiarPlayerImpl>(this, _$identity);
}

abstract class _LiarPlayer implements LiarPlayer {
  const factory _LiarPlayer({
    required final String name,
    required final LiarRole role,
    final String? word,
  }) = _$LiarPlayerImpl;

  @override
  String get name;
  @override
  LiarRole get role;
  @override
  String? get word;

  /// Create a copy of LiarPlayer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiarPlayerImplCopyWith<_$LiarPlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LiarGameSettings {
  int get playerCount => throw _privateConstructorUsedError;
  LiarGameMode get mode => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get timerMinutes => throw _privateConstructorUsedError;

  /// Create a copy of LiarGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiarGameSettingsCopyWith<LiarGameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiarGameSettingsCopyWith<$Res> {
  factory $LiarGameSettingsCopyWith(
    LiarGameSettings value,
    $Res Function(LiarGameSettings) then,
  ) = _$LiarGameSettingsCopyWithImpl<$Res, LiarGameSettings>;
  @useResult
  $Res call({
    int playerCount,
    LiarGameMode mode,
    String category,
    int timerMinutes,
  });
}

/// @nodoc
class _$LiarGameSettingsCopyWithImpl<$Res, $Val extends LiarGameSettings>
    implements $LiarGameSettingsCopyWith<$Res> {
  _$LiarGameSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiarGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerCount = null,
    Object? mode = null,
    Object? category = null,
    Object? timerMinutes = null,
  }) {
    return _then(
      _value.copyWith(
            playerCount:
                null == playerCount
                    ? _value.playerCount
                    : playerCount // ignore: cast_nullable_to_non_nullable
                        as int,
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as LiarGameMode,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            timerMinutes:
                null == timerMinutes
                    ? _value.timerMinutes
                    : timerMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiarGameSettingsImplCopyWith<$Res>
    implements $LiarGameSettingsCopyWith<$Res> {
  factory _$$LiarGameSettingsImplCopyWith(
    _$LiarGameSettingsImpl value,
    $Res Function(_$LiarGameSettingsImpl) then,
  ) = __$$LiarGameSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int playerCount,
    LiarGameMode mode,
    String category,
    int timerMinutes,
  });
}

/// @nodoc
class __$$LiarGameSettingsImplCopyWithImpl<$Res>
    extends _$LiarGameSettingsCopyWithImpl<$Res, _$LiarGameSettingsImpl>
    implements _$$LiarGameSettingsImplCopyWith<$Res> {
  __$$LiarGameSettingsImplCopyWithImpl(
    _$LiarGameSettingsImpl _value,
    $Res Function(_$LiarGameSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiarGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerCount = null,
    Object? mode = null,
    Object? category = null,
    Object? timerMinutes = null,
  }) {
    return _then(
      _$LiarGameSettingsImpl(
        playerCount:
            null == playerCount
                ? _value.playerCount
                : playerCount // ignore: cast_nullable_to_non_nullable
                    as int,
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as LiarGameMode,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        timerMinutes:
            null == timerMinutes
                ? _value.timerMinutes
                : timerMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$LiarGameSettingsImpl implements _LiarGameSettings {
  const _$LiarGameSettingsImpl({
    required this.playerCount,
    required this.mode,
    required this.category,
    required this.timerMinutes,
  });

  @override
  final int playerCount;
  @override
  final LiarGameMode mode;
  @override
  final String category;
  @override
  final int timerMinutes;

  @override
  String toString() {
    return 'LiarGameSettings(playerCount: $playerCount, mode: $mode, category: $category, timerMinutes: $timerMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiarGameSettingsImpl &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.timerMinutes, timerMinutes) ||
                other.timerMinutes == timerMinutes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, playerCount, mode, category, timerMinutes);

  /// Create a copy of LiarGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiarGameSettingsImplCopyWith<_$LiarGameSettingsImpl> get copyWith =>
      __$$LiarGameSettingsImplCopyWithImpl<_$LiarGameSettingsImpl>(
        this,
        _$identity,
      );
}

abstract class _LiarGameSettings implements LiarGameSettings {
  const factory _LiarGameSettings({
    required final int playerCount,
    required final LiarGameMode mode,
    required final String category,
    required final int timerMinutes,
  }) = _$LiarGameSettingsImpl;

  @override
  int get playerCount;
  @override
  LiarGameMode get mode;
  @override
  String get category;
  @override
  int get timerMinutes;

  /// Create a copy of LiarGameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiarGameSettingsImplCopyWith<_$LiarGameSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LiarGameState {
  int get playerCount => throw _privateConstructorUsedError;
  LiarGameMode get mode => throw _privateConstructorUsedError;
  List<String> get wordDeck => throw _privateConstructorUsedError;
  List<LiarPlayer> get players => throw _privateConstructorUsedError;
  int get currentPlayerIndex => throw _privateConstructorUsedError;
  bool get isGameStarted => throw _privateConstructorUsedError;
  int get timerMinutes => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  int? get selectedPlayer => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiarGameStateCopyWith<LiarGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiarGameStateCopyWith<$Res> {
  factory $LiarGameStateCopyWith(
    LiarGameState value,
    $Res Function(LiarGameState) then,
  ) = _$LiarGameStateCopyWithImpl<$Res, LiarGameState>;
  @useResult
  $Res call({
    int playerCount,
    LiarGameMode mode,
    List<String> wordDeck,
    List<LiarPlayer> players,
    int currentPlayerIndex,
    bool isGameStarted,
    int timerMinutes,
    int step,
    int? selectedPlayer,
    String? error,
  });
}

/// @nodoc
class _$LiarGameStateCopyWithImpl<$Res, $Val extends LiarGameState>
    implements $LiarGameStateCopyWith<$Res> {
  _$LiarGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerCount = null,
    Object? mode = null,
    Object? wordDeck = null,
    Object? players = null,
    Object? currentPlayerIndex = null,
    Object? isGameStarted = null,
    Object? timerMinutes = null,
    Object? step = null,
    Object? selectedPlayer = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            playerCount:
                null == playerCount
                    ? _value.playerCount
                    : playerCount // ignore: cast_nullable_to_non_nullable
                        as int,
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as LiarGameMode,
            wordDeck:
                null == wordDeck
                    ? _value.wordDeck
                    : wordDeck // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            players:
                null == players
                    ? _value.players
                    : players // ignore: cast_nullable_to_non_nullable
                        as List<LiarPlayer>,
            currentPlayerIndex:
                null == currentPlayerIndex
                    ? _value.currentPlayerIndex
                    : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            isGameStarted:
                null == isGameStarted
                    ? _value.isGameStarted
                    : isGameStarted // ignore: cast_nullable_to_non_nullable
                        as bool,
            timerMinutes:
                null == timerMinutes
                    ? _value.timerMinutes
                    : timerMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
            step:
                null == step
                    ? _value.step
                    : step // ignore: cast_nullable_to_non_nullable
                        as int,
            selectedPlayer:
                freezed == selectedPlayer
                    ? _value.selectedPlayer
                    : selectedPlayer // ignore: cast_nullable_to_non_nullable
                        as int?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiarGameStateImplCopyWith<$Res>
    implements $LiarGameStateCopyWith<$Res> {
  factory _$$LiarGameStateImplCopyWith(
    _$LiarGameStateImpl value,
    $Res Function(_$LiarGameStateImpl) then,
  ) = __$$LiarGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int playerCount,
    LiarGameMode mode,
    List<String> wordDeck,
    List<LiarPlayer> players,
    int currentPlayerIndex,
    bool isGameStarted,
    int timerMinutes,
    int step,
    int? selectedPlayer,
    String? error,
  });
}

/// @nodoc
class __$$LiarGameStateImplCopyWithImpl<$Res>
    extends _$LiarGameStateCopyWithImpl<$Res, _$LiarGameStateImpl>
    implements _$$LiarGameStateImplCopyWith<$Res> {
  __$$LiarGameStateImplCopyWithImpl(
    _$LiarGameStateImpl _value,
    $Res Function(_$LiarGameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerCount = null,
    Object? mode = null,
    Object? wordDeck = null,
    Object? players = null,
    Object? currentPlayerIndex = null,
    Object? isGameStarted = null,
    Object? timerMinutes = null,
    Object? step = null,
    Object? selectedPlayer = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$LiarGameStateImpl(
        playerCount:
            null == playerCount
                ? _value.playerCount
                : playerCount // ignore: cast_nullable_to_non_nullable
                    as int,
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as LiarGameMode,
        wordDeck:
            null == wordDeck
                ? _value._wordDeck
                : wordDeck // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        players:
            null == players
                ? _value._players
                : players // ignore: cast_nullable_to_non_nullable
                    as List<LiarPlayer>,
        currentPlayerIndex:
            null == currentPlayerIndex
                ? _value.currentPlayerIndex
                : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        isGameStarted:
            null == isGameStarted
                ? _value.isGameStarted
                : isGameStarted // ignore: cast_nullable_to_non_nullable
                    as bool,
        timerMinutes:
            null == timerMinutes
                ? _value.timerMinutes
                : timerMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
        step:
            null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                    as int,
        selectedPlayer:
            freezed == selectedPlayer
                ? _value.selectedPlayer
                : selectedPlayer // ignore: cast_nullable_to_non_nullable
                    as int?,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$LiarGameStateImpl implements _LiarGameState {
  const _$LiarGameStateImpl({
    required this.playerCount,
    required this.mode,
    required final List<String> wordDeck,
    required final List<LiarPlayer> players,
    required this.currentPlayerIndex,
    required this.isGameStarted,
    required this.timerMinutes,
    required this.step,
    this.selectedPlayer,
    this.error,
  }) : _wordDeck = wordDeck,
       _players = players;

  @override
  final int playerCount;
  @override
  final LiarGameMode mode;
  final List<String> _wordDeck;
  @override
  List<String> get wordDeck {
    if (_wordDeck is EqualUnmodifiableListView) return _wordDeck;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordDeck);
  }

  final List<LiarPlayer> _players;
  @override
  List<LiarPlayer> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final int currentPlayerIndex;
  @override
  final bool isGameStarted;
  @override
  final int timerMinutes;
  @override
  final int step;
  @override
  final int? selectedPlayer;
  @override
  final String? error;

  @override
  String toString() {
    return 'LiarGameState(playerCount: $playerCount, mode: $mode, wordDeck: $wordDeck, players: $players, currentPlayerIndex: $currentPlayerIndex, isGameStarted: $isGameStarted, timerMinutes: $timerMinutes, step: $step, selectedPlayer: $selectedPlayer, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiarGameStateImpl &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality().equals(other._wordDeck, _wordDeck) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex) &&
            (identical(other.isGameStarted, isGameStarted) ||
                other.isGameStarted == isGameStarted) &&
            (identical(other.timerMinutes, timerMinutes) ||
                other.timerMinutes == timerMinutes) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.selectedPlayer, selectedPlayer) ||
                other.selectedPlayer == selectedPlayer) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerCount,
    mode,
    const DeepCollectionEquality().hash(_wordDeck),
    const DeepCollectionEquality().hash(_players),
    currentPlayerIndex,
    isGameStarted,
    timerMinutes,
    step,
    selectedPlayer,
    error,
  );

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiarGameStateImplCopyWith<_$LiarGameStateImpl> get copyWith =>
      __$$LiarGameStateImplCopyWithImpl<_$LiarGameStateImpl>(this, _$identity);
}

abstract class _LiarGameState implements LiarGameState {
  const factory _LiarGameState({
    required final int playerCount,
    required final LiarGameMode mode,
    required final List<String> wordDeck,
    required final List<LiarPlayer> players,
    required final int currentPlayerIndex,
    required final bool isGameStarted,
    required final int timerMinutes,
    required final int step,
    final int? selectedPlayer,
    final String? error,
  }) = _$LiarGameStateImpl;

  @override
  int get playerCount;
  @override
  LiarGameMode get mode;
  @override
  List<String> get wordDeck;
  @override
  List<LiarPlayer> get players;
  @override
  int get currentPlayerIndex;
  @override
  bool get isGameStarted;
  @override
  int get timerMinutes;
  @override
  int get step;
  @override
  int? get selectedPlayer;
  @override
  String? get error;

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiarGameStateImplCopyWith<_$LiarGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
