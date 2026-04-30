import 'package:flutter/material.dart';

class InsightCard extends StatelessWidget {
  final String text;
  final String? source;
  final VoidCallback? onExpand;

  const InsightCard({
    super.key,
    required this.text,
    this.source,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.insights_outlined,
                  color: Color(0xFFD4A853),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ],
            ),
            if (source != null) ...[
              const SizedBox(height: 12),
              Divider(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                height: 1,
              ),
              const SizedBox(height: 8),
              Text(
                source!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onAction;

  const ActionCard({
    super.key,
    required this.title,
    required this.content,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
          center: Alignment.topLeft,
          radius: 1.0,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.lightbulb_outlined,
                  color: Color(0xFF1A1612),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF1A1612),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF1A1612),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodSelector extends StatelessWidget {
  final int? selectedMood;
  final Function(int) onMoodSelected;

  const MoodSelector({
    super.key,
    this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _MoodOption(
          emoji: '😤',
          label: 'Hard',
          value: 1,
          isSelected: selectedMood == 1,
          onTap: () => onMoodSelected(1),
        ),
        _MoodOption(
          emoji: '😐',
          label: 'Meh',
          value: 2,
          isSelected: selectedMood == 2,
          onTap: () => onMoodSelected(2),
        ),
        _MoodOption(
          emoji: '🤔',
          label: 'Weird',
          value: 3,
          isSelected: selectedMood == 3,
          onTap: () => onMoodSelected(3),
        ),
        _MoodOption(
          emoji: '😊',
          label: 'Free',
          value: 4,
          isSelected: selectedMood == 4,
          onTap: () => onMoodSelected(4),
        ),
      ],
    );
  }
}

class _MoodOption extends StatelessWidget {
  final String emoji;
  final String label;
  final int value;
  final bool isSelected;
  final VoidCallback onTap;

  const _MoodOption({
    required this.emoji,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFF241F1A),
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? const Color(0xFFD4A853)
                : const Color(0xFF241F1A),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: TextStyle(
                fontSize: 24,
                color: isSelected ? const Color(0xFF1A1612) : const Color(0xFFB0A292),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isSelected ? const Color(0xFF1A1612) : const Color(0xFFB0A292),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
