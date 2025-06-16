import 'package:flutter/material.dart';

class PlayerCountSelector extends StatelessWidget {
  final int currentCount;
  final ValueChanged<int> onChanged;
  final int minPlayers;
  final int maxPlayers;
  final String? title;

  const PlayerCountSelector({
    super.key,
    required this.currentCount,
    required this.onChanged,
    this.minPlayers = 3,
    this.maxPlayers = 10,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: currentCount > minPlayers
                  ? () => onChanged(currentCount - 1)
                  : null,
              icon: const Icon(Icons.remove),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$currentCount명',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: currentCount < maxPlayers
                  ? () => onChanged(currentCount + 1)
                  : null,
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '$minPlayers-$maxPlayers명까지 가능',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
} 