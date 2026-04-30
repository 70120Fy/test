import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/diagnostic_provider.dart';
import '../../providers/onboarding_provider.dart';
import '../../widgets/animated/golden_button.dart';

class DiagnosticIntroScreen extends StatelessWidget {
  const DiagnosticIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            Icon(
              Icons.insights_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'The Discipline Diagnostic',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Take our 15-question diagnostic to identify your discipline block and get a personalized 7-day program.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            GoldenButton(
              width: double.infinity,
              height: 64,
              onPressed: () {
                context.read<DiagnosticProvider>().resetQuiz();
                context.go('/diagnostic-quiz');
              },
              child: const Text('Take the Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
