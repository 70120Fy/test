import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final int currentQuestion;
  final int totalQuestions;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;

  const QuestionCard({
    super.key,
    required this.question,
    required this.currentQuestion,
    required this.totalQuestions,
    this.onNext,
    this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
          center: Alignment.topLeft,
          radius: 1.0,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Question $currentQuestion of $totalQuestions',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF1A1612),
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              question,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF1A1612),
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFD4A853)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFD4A853)
                : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected
                    ? const Color(0xFF1A1612)
                    : Theme.of(context).colorScheme.primary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}

class QuizProgress extends StatelessWidget {
  final double progress;
  final Color color;
  final Color backgroundColor;

  const QuizProgress({
    super.key,
    required this.progress,
    this.color = const Color(0xFFD4A853),
    this.backgroundColor = const Color(0xFF241F1A),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 240 * progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
