// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liar_game_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

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
  LiarPlayer? get selectedPlayer => throw _privateConstructorUsedError;
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
    LiarPlayer? selectedPlayer,
    String? error,
  });

  $LiarPlayerCopyWith<$Res>? get selectedPlayer;
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
                        as LiarPlayer?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiarPlayerCopyWith<$Res>? get selectedPlayer {
    if (_value.selectedPlayer == null) {
      return null;
    }

    return $LiarPlayerCopyWith<$Res>(_value.selectedPlayer!, (value) {
      return _then(_value.copyWith(selectedPlayer: value) as $Val);
    });
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
    LiarPlayer? selectedPlayer,
    String? error,
  });

  @override
  $LiarPlayerCopyWith<$Res>? get selectedPlayer;
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
                    as LiarPlayer?,
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
    this.playerCount = 3,
    this.mode = LiarGameMode.normal,
    final List<String> wordDeck = const [],
    final List<LiarPlayer> players = const [],
    this.currentPlayerIndex = 0,
    this.isGameStarted = false,
    this.timerMinutes = 3,
    this.step = 0,
    this.selectedPlayer = null,
    this.error = null,
  }) : _wordDeck = wordDeck,
       _players = players;

  @override
  @JsonKey()
  final int playerCount;
  @override
  @JsonKey()
  final LiarGameMode mode;
  final List<String> _wordDeck;
  @override
  @JsonKey()
  List<String> get wordDeck {
    if (_wordDeck is EqualUnmodifiableListView) return _wordDeck;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordDeck);
  }

  final List<LiarPlayer> _players;
  @override
  @JsonKey()
  List<LiarPlayer> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final int currentPlayerIndex;
  @override
  @JsonKey()
  final bool isGameStarted;
  @override
  @JsonKey()
  final int timerMinutes;
  @override
  @JsonKey()
  final int step;
  @override
  @JsonKey()
  final LiarPlayer? selectedPlayer;
  @override
  @JsonKey()
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
    final int playerCount,
    final LiarGameMode mode,
    final List<String> wordDeck,
    final List<LiarPlayer> players,
    final int currentPlayerIndex,
    final bool isGameStarted,
    final int timerMinutes,
    final int step,
    final LiarPlayer? selectedPlayer,
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
  LiarPlayer? get selectedPlayer;
  @override
  String? get error;

  /// Create a copy of LiarGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiarGameStateImplCopyWith<_$LiarGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
