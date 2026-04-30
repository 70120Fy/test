import 'package:flutter/material.dart';

import '../../widgets/cards/program_card.dart';

class ProgramDetailScreen extends StatelessWidget {
  const ProgramDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ProgramDetailCard(
            title: '7-Day Perfectionism Reset',
            description:
                'When everything has to be perfect, nothing gets done. This program dismantles the perfectionism trap one day at a time.',
            outcomes: [
              'Ship work at 70% without anxiety',
              'Recognize perfectionism as fear, not standards',
              'Build momentum through imperfect action',
            ],
            progress: 0.43,
            onContinue: () {},
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Day by Day',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(7, (index) => _DayItem(
                day: index + 1,
                title: index == 0
                    ? 'The Terrible First Draft'
                    : index == 1
                        ? 'The 70% Standard'
                        : 'Day ${index + 1}',
                status: index < 3 ? 'completed' : index == 3 ? 'current' : 'locked',
              )),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GoldenButton(
              onPressed: () {
                context.go('/protocol');
              },
              child: const Text('Continue Day 3'),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _DayItem extends StatelessWidget {
  final int day;
  final String title;
  final String status;

  const _DayItem({
    required this.day,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == 'completed';
    final isCurrent = status == 'current';
    final isLocked = status == 'locked';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLocked
            ? Theme.of(context).cardColor
            : isCompleted
                ? const Color(0xFFD4A853).withOpacity(0.1)
                : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isLocked
              ? const Color(0xFF241F1A)
              : isCompleted
                  ? const Color(0xFF5B9E5B)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isLocked
                  ? const Color(0xFF241F1A)
                  : isCompleted
                      ? const Color(0xFF5B9E5B)
                      : isCurrent
                          ? const Color(0xFFD4A853)
                          : Theme.of(context).colorScheme.primary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isLocked ? '🔒' : isCompleted ? '✓' : '$day',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isLocked
                      ? const Color(0xFFD4A853)
                      : isCompleted
                          ? const Color(0xFF1A1612)
                          : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          if (isLocked)
            Icon(
              Icons.lock_outline,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
          if (isCurrent)
            Icon(
              Icons.play_arrow,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
        ],
      ),
    );
  }
}

class GoldenButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double height;

  const GoldenButton({
    super.key,
    this.onPressed,
    required this.child,
    this.padding,
    this.width,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
          center: Alignment.topLeft,
          radius: 1.0,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD4A853).withOpacity(0.3),
            offset: const Offset(0, 4),
            blur: 16,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Color(0xFF1A1612),
            fontWeight: FontWeight.w600,
          ),
          child: child,
        ),
      ),
    );
  }
}
