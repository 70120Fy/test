import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String title;
  final String? message;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.title,
    this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFC44B4B).withOpacity(0.1),
              ),
              child: const Icon(
                Icons.error_outline,
                color: Color(0xFFC44B4B),
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 12),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              GoldenButton(
                onPressed: onRetry,
                child: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class EmptyStateView extends StatelessWidget {
  final String title;
  final String? message;
  final String? icon;

  const EmptyStateView({
    super.key,
    required this.title,
    this.message,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Text(
                icon!,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            if (icon == null)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFD4A853).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.inbox_outlined,
                  color: Color(0xFFD4A853),
                  size: 40,
                ),
              ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 12),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class TrialBanner extends StatelessWidget {
  final int daysLeft;
  final VoidCallback? onUpgrade;

  const TrialBanner({
    super.key,
    required this.daysLeft,
    this.onUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    final isUrgent = daysLeft <= 1;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: isUrgent
            ? const Color(0xFFC44B4B).withOpacity(0.15)
            : const Color(0xFFE89B3E).withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUrgent
              ? const Color(0xFFC44B4B)
              : const Color(0xFFE89B3E),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              isUrgent ? Icons.warning : Icons.timer,
              color: isUrgent ? const Color(0xFFC44B4B) : const Color(0xFFE89B3E),
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isUrgent
                    ? 'Last day! Subscribe to keep your progress'
                    : '$daysLeft days left in your trial',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isUrgent ? const Color(0xFFC44B4B) : const Color(0xFFE89B3E),
                    ),
              ),
            ),
            if (onUpgrade != null)
              TextButton(
                onPressed: onUpgrade,
                style: TextButton.styleFrom(
                  foregroundColor: isUrgent
                      ? const Color(0xFFC44B4B)
                      : const Color(0xFFE89B3E),
                ),
                child: const Text('View Plans'),
              ),
          ],
        ),
      ),
    );
  }
}
