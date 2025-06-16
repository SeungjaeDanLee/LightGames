import 'package:flutter/material.dart';

class GamePrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;

  const GamePrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.black,
        padding: padding,
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );

    if (icon != null) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.black,
          padding: padding,
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        icon: Icon(icon),
        onPressed: onPressed,
        label: Text(text, style: const TextStyle(color: Colors.black)),
      );
    }

    return button;
  }
}

class GameSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;

  const GameSecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      child: Text(text),
    );

    if (icon != null) {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          padding: padding,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        icon: Icon(icon),
        onPressed: onPressed,
        label: Text(text),
      );
    }

    return button;
  }
} 