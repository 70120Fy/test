import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/subscription_provider.dart';
import '../../services/content_service.dart';
import '../../widgets/cards/program_card.dart';
import '../../widgets/layout/gold_bottom_nav.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  int _currentIndex = 0;
  bool _isLoading = true;
  List<ProgramCardData> _programs = [];

  @override
  void initState() {
    super.initState();
    _loadPrograms();
  }

  Future<void> _loadPrograms() async {
    final contentService = context.read<ContentService>();
    await contentService.initialize();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final subProvider = context.watch<SubscriptionProvider>();

    if (_isLoading) {
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
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  'Programs',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A853),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildCategory(
            'Your Prescription',
            _programs.take(2).toList(),
            subProvider,
          ),
          const SizedBox(height: 32),
          _buildCategory(
            'All Programs',
            _programs.skip(2).toList(),
            subProvider,
          ),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: BottomNavBuilder4(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              break;
            case 2:
              context.go('/programs');
              break;
            case 3:
              context.go('/insights');
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategory(
    String title,
    List<ProgramCardData> programs,
    SubscriptionProvider subProvider,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          if (programs.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              child: Text(
                'No programs yet',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          else
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: programs
                    .map((p) => p.isLocked
                        ? LockedProgramCard(
                            title: p.title,
                            subtitle: p.subtitle,
                            onLockTap: subProvider.canAccessProgram()
                                ? null
                                : () => context.go('/paywall'),
                          )
                        : ProgramCard(
                            title: p.title,
                            subtitle: p.subtitle,
                            thumbnail: p.thumbnail,
                            isCompleted: p.isCompleted,
                            isCurrent: p.isCurrent,
                          ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class ProgramCardData {
  final String title;
  final String subtitle;
  final String? thumbnail;
  final bool isLocked;
  final bool isCompleted;
  final bool isCurrent;

  ProgramCardData({
    required this.title,
    required this.subtitle,
    this.thumbnail,
    this.isLocked = false,
    this.isCompleted = false,
    this.isCurrent = false,
  });
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
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
                  color: const Color(0xFF241F1A),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '🔒',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD4A853),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
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
