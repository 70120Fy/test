import 'package:flutter/material.dart';

class ProtocolCard extends StatelessWidget {
  final String dayText;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool isActive;
  final bool isCompleted;

  const ProtocolCard({
    super.key,
    required this.dayText,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isActive = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLocked = !isActive && !isCompleted;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFD4A853).withOpacity(0.1)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive
                ? const Color(0xFFD4A853)
                : isCompleted
                    ? const Color(0xFF5B9E5B)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: isActive || isCompleted ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFFD4A853)
                          : isCompleted
                              ? const Color(0xFF5B9E5B)
                              : const Color(0xFF241F1A),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      isCompleted ? '✓' : isActive ? '🔥' : '🔒',
                      style: TextStyle(
                        fontSize: 12,
                        color: isCompleted
                            ? const Color(0xFF1A1612)
                            : const Color(0xFFD4A853),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      dayText,
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (isLocked) ...[
                const SizedBox(height: 8),
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xFF241F1A),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xFF3A322B),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color(0xFFD4A853),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveProtocolCard extends StatelessWidget {
  final int day;
  final int totalDays;
  final String title;
  final VoidCallback? onTap;

  const ActiveProtocolCard({
    super.key,
    required this.day,
    required this.totalDays,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ProtocolCard(
      dayText: 'Day $day of $totalDays',
      title: title,
      isActive: true,
      onTap: onTap,
    );
  }
}

class CompletedProtocolCard extends StatelessWidget {
  final String programName;
  final int days;
  final VoidCallback? onTap;

  const CompletedProtocolCard({
    super.key,
    required this.programName,
    required this.days,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ProtocolCard(
      dayText: '$days days',
      title: programName,
      isCompleted: true,
      subtitle: 'Completed',
      onTap: onTap,
    );
  }
}

class LockedProtocolCard extends StatelessWidget {
  final String title;
  final String? subtitle;

  const LockedProtocolCard({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ProtocolCard(
      dayText: '',
      title: title,
      subtitle: subtitle,
      isLocked: true,
    );
  }
}
