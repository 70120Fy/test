import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../providers/diagnostic_provider.dart';
import '../../models/discipline_block.dart';
import '../../models/willpower_type.dart';
import '../../widgets/animated/golden_button.dart';
import '../../core/constants/app_colors.dart';

class DiagnosticResultScreen extends StatelessWidget {
  const DiagnosticResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiagnosticProvider>();
    final result = provider.result;

    if (result == null) {
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

    final primaryBlock = result.primaryBlock;
    final secondaryBlock = result.secondaryBlock;
    final willpowerType = result.willpowerType;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Text(
              'Your #1 Discipline Block',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              primaryBlock.shortName,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.gold300,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              primaryBlock.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                primaryBlock.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.gold400.withOpacity(0.15),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  if (secondaryBlock != null)
                    Text(
                      'Your Secondary Block',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    secondaryBlock?.shortName ?? '—',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.gold300,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppColors.gold400.withOpacity(0.15),
                    height: 1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Willpower Type',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    willpowerType.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            GoldenButton(
              width: double.infinity,
              height: 64,
              onPressed: () {
                context.go('/home');
              },
              child: const Text('Start Your 7-Day Reset'),
            ),
          ],
        ),
      ).animate().fadeIn(duration: const Duration(milliseconds: 600)),
    );
  }
}
