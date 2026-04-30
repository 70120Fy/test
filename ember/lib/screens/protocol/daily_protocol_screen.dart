import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/streak_provider.dart';
import '../../providers/mood_provider.dart';
import '../../widgets/cards/insight_card.dart';
import '../../widgets/cards/protocol_card.dart';
import '../../widgets/animated/confetti_overlay.dart';

class DailyProtocolScreen extends StatefulWidget {
  const DailyProtocolScreen({super.key});

  @override
  State<DailyProtocolScreen> createState() => _DailyProtocolScreenState();
}

class _DailyProtocolScreenState extends State<DailyProtocolScreen> {
  int? _selectedMood;

  @override
  Widget build(BuildContext context) {
    final moodProvider = context.watch<MoodProvider>();

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
                const Spacer(),
                const Text('Day 1 of 7'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                7,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < 3
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'The 70% Standard',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          InsightCard(
            text:
                'The last 30% of perfection takes 80% of your time and rarely changes outcomes. Ship at 70%. The world rewards done, not perfect.',
            source: '— The Grit Equation, Ch 5',
          ),
          const SizedBox(height: 16),
          ActionCard(
            title: 'Today\'s Action',
            content:
                'Pick one task you\'ve been overthinking. Do it to 70% and STOP. Walk away. Notice the discomfort — that\'s your perfectionism, not your standards.',
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'How did it feel?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          MoodSelector(
            selectedMood: _selectedMood,
            onMoodSelected: (mood) {
              setState(() {
                _selectedMood = mood;
              });
            },
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GoldenButton(
              width: double.infinity,
              height: 64,
              onPressed: _selectedMood != null
                  ? () {
                      _completeSession(context);
                    }
                  : null,
              child: const Text('I Did It Today'),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Future<void> _completeSession(BuildContext context) async {
    final streakProvider = context.read<StreakProvider>();
    await streakProvider.completeSession();

    if (mounted) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) => Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Day 1 Complete',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.flame,
                          color: Theme.of(context).colorScheme.primary,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '1 day',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Done',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              GoldenButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Continue to Day 2'),
              ),
            ],
          ),
        ),
      );
    }
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
                color: isSelected
                    ? const Color(0xFF1A1612)
                    : const Color(0xFFB0A292),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isSelected
                        ? const Color(0xFF1A1612)
                        : const Color(0xFFB0A292),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
