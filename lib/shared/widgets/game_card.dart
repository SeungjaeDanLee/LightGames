import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  const GameCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(8),
    this.backgroundColor,
    this.elevation = 2,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final cardChild = Padding(
      padding: padding!,
      child: child,
    );

    return Container(
      margin: margin,
      child: Card(
        color: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                borderRadius: (borderRadius ?? BorderRadius.circular(12)) as BorderRadius,
                child: cardChild,
              )
            : cardChild,
      ),
    );
  }
}

class GameInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  final Color? iconColor;

  const GameInfoCard({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GameCard(
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? Theme.of(context).colorScheme.primary,
              size: 32,
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 