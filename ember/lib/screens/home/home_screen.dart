import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/streak_provider.dart';
import '../../providers/subscription_provider.dart';
import '../../providers/onboarding_provider.dart';
import '../../models/program.dart';
import '../../widgets/cards/protocol_card.dart';
import '../../widgets/common/stat_card.dart';
import '../../widgets/layout/gold_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final streakProvider = context.watch<StreakProvider>();
    final subProvider = context.watch<SubscriptionProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good morning',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outlined),
                      onPressed: () {
                        _currentIndex = 3;
                        setState(() {});
                        context.go('/profile');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (subProvider.isTrialActive && subProvider.trialDaysRemaining <= 4)
            TrialBanner(
              daysLeft: subProvider.trialDaysRemaining,
              onUpgrade: () => context.go('/paywall'),
            ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: StatCard(
                    label: 'Current Streak',
                    value: '${streakProvider.currentStreak} days',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Today\'s Protocol',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          if (streakProvider.streak != null &&
              streakProvider.streak!.currentStreak > 0)
            ActiveProtocolCard(
              day: streakProvider.streak!.currentStreak,
              totalDays: 7,
              title: 'The 70% Standard',
              onTap: () => context.go('/protocol'),
            )
          else
            ActiveProtocolCard(
              day: 1,
              totalDays: 7,
              title: 'Begin Your Journey',
              onTap: () => context.go('/protocol'),
            ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Your Programs',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                LockedProtocolCard(
                  title: 'Perfectionism Reset',
                  subtitle: '7 days',
                ),
                LockedProtocolCard(
                  title: 'Overwhelm Recovery',
                  subtitle: '7 days',
                ),
                LockedProtocolCard(
                  title: 'Future Self',
                  subtitle: '7 days',
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: BottomNavBuilder(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              break;
            case 1:
              context.go('/programs');
              break;
            case 2:
              context.go('/insights');
              break;
          }
        },
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
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
              color: isUrgent
                  ? const Color(0xFFC44B4B)
                  : const Color(0xFFE89B3E),
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isUrgent
                    ? 'Last day! Subscribe to keep your progress'
                    : '$daysLeft days left in your trial',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isUrgent
                          ? const Color(0xFFC44B4B)
                          : const Color(0xFFE89B3E),
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
