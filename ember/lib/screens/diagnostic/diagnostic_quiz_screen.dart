import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/diagnostic_provider.dart';
import '../../widgets/quiz/answer_option.dart';
import '../../widgets/common/stat_card.dart';

class DiagnosticQuizScreen extends StatelessWidget {
  const DiagnosticQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiagnosticProvider>();
    final question = provider.currentQuestion;
    final currentQuestionIndex = provider.currentQuestionIndex;
    final totalQuestions = provider.totalQuestions;

    if (question == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: provider.currentQuestionIndex > 0
                      ? () {
                          provider.previousQuestion();
                        }
                      : null,
                ),
                Text(
                  'Question ${currentQuestionIndex + 1}/$totalQuestions',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const RadialGradient(
                        colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
                        center: Alignment.topLeft,
                        radius: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      question['text'] as String,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: const Color(0xFF1A1612),
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...((question['answers'] as List)
                          .map((answer) => AnswerOption(
                                text: answer['text'] as String,
                                isSelected: false,
                                onTap: () {
                                  provider.answerQuestion(
                                    answer['id'] as String,
                                    answer,
                                  );
                                  provider.nextQuestion();
                                },
                              ))
                          .toList()),
                ],
              ),
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
