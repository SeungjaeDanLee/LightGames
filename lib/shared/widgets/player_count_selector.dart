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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$minPlayers명', style: const TextStyle(color: Colors.grey)),
            Text(
              '$currentCount명',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('$maxPlayers명', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        Slider(
          value: currentCount.toDouble(),
          min: minPlayers.toDouble(),
          max: maxPlayers.toDouble(),
          divisions: maxPlayers - minPlayers,
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: (value) {
            onChanged(value.round());
          },
        ),
      ],
    );
  }
} 