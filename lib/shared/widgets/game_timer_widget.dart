import 'package:flutter/material.dart';
import 'dart:async';

class GameTimerWidget extends StatefulWidget {
  final int initialMinutes;
  final VoidCallback? onTimerEnd;
  final bool isActive;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? progressColor;
  final bool showProgress;

  const GameTimerWidget({
    super.key,
    required this.initialMinutes,
    this.onTimerEnd,
    this.isActive = true,
    this.textStyle,
    this.backgroundColor,
    this.progressColor,
    this.showProgress = true,
  });

  @override
  State<GameTimerWidget> createState() => _GameTimerWidgetState();
}

class _GameTimerWidgetState extends State<GameTimerWidget> {
  Timer? _timer;
  late int _remainingSeconds;
  late int _totalSeconds;

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.initialMinutes * 60;
    _remainingSeconds = _totalSeconds;
    if (widget.isActive) {
      _startTimer();
    }
  }

  @override
  void didUpdateWidget(GameTimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _startTimer();
      } else {
        _stopTimer();
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _stopTimer();
          widget.onTimerEnd?.call();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get _progress {
    if (_totalSeconds == 0) return 0;
    return (_totalSeconds - _remainingSeconds) / _totalSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: _remainingSeconds <= 30 ? Colors.red : null,
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _remainingSeconds <= 30 
                  ? Colors.red 
                  : Theme.of(context).colorScheme.outline,
              width: 2,
            ),
          ),
          child: Text(
            _formattedTime,
            style: widget.textStyle ?? defaultTextStyle,
          ),
        ),
        if (widget.showProgress) ...[
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: _progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.progressColor ?? 
              (_remainingSeconds <= 30 ? Colors.red : Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ],
    );
  }
} 