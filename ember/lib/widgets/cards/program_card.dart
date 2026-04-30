import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? thumbnail;
  final VoidCallback? onTap;
  final bool isLocked;
  final bool isCompleted;
  final bool isCurrent;

  const ProgramCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.thumbnail,
    this.onTap,
    this.isLocked = false,
    this.isCompleted = false,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isLocked
                      ? const Color(0xFF241F1A)
                      : isCompleted
                          ? const Color(0xFF5B9E5B)
                          : const Color(0xFFD4A853),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    isLocked
                        ? '🔒'
                        : isCompleted
                            ? '✓'
                            : '🔥',
                    style: TextStyle(
                      fontSize: 20,
                      color: isCompleted
                          ? const Color(0xFF1A1612)
                          : const Color(0xFF1A1612),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LockedProgramCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onLockTap;

  const LockedProgramCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onLockTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLockTap,
      child: ProgramCard(
        title: title,
        subtitle: subtitle,
        isLocked: true,
      ),
    );
  }
}

class ProgramDetailCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> outcomes;
  final double progress;
  final VoidCallback? onContinue;

  const ProgramDetailCard({
    super.key,
    required this.title,
    required this.description,
    required this.outcomes,
    required this.progress,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
          center: Alignment.topLeft,
          radius: 1.0,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1612),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF1A1612),
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFD4A853).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What you\'ll build',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: const Color(0xFF1A1612),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...outcomes.map((outcome) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.lightbulb_outlined,
                            size: 16,
                            color: Color(0xFF1A1612),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              outcome,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF1A1612),
                                  ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(progress * 100).toInt()}% Complete',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF1A1612),
                      ),
                ),
                Text(
                  progress >= 1.0 ? 'Completed' : 'In Progress',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF1A1612),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFF1A1612).withOpacity(0.3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 120 * progress,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFD4A853),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (onContinue != null)
              GoldButton(
                onPressed: onContinue,
                child: Text(
                  progress >= 1.0 ? 'View Results' : 'Continue Program',
                  style: const TextStyle(
                    color: Color(0xFF1A1612),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
