import 'package:flutter/material.dart';

class GameSectionTitle extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;

  const GameSectionTitle(
    this.title, {
    super.key,
    this.textAlign = TextAlign.left,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlign: textAlign,
      ),
    );
  }
} 