import 'package:hive/hive.dart';

part 'discipline_block.g.dart';

@HiveType(typeId: 0)
enum DisciplineBlock {
  @HiveField(0)
  perfectionismParalysis(
    id: 'perfectionism_paralysis',
    name: 'Perfectionism Paralysis',
    shortName: 'Perfectionism',
    description: "You don't lack motivation — you're protecting yourself from the vulnerability of imperfect work.",
    source: 'Book 1, Chapter 2',
    icon: '🎯',
    color: 0xFFD4A853,
  ),
  @HiveField(1)
  overwhelmParalysis(
    id: 'overwhelm_paralysis',
    name: 'Overwhelm Paralysis',
    shortName: 'Overwhelm',
    description: "Your brain can't form a clear starting point. You see the mountain, not the first step.",
    source: 'Book 1, Chapter 2',
    icon: '⛰️',
    color: 0xFFE89B3E,
  ),
  @HiveField(2)
  taskAversion(
    id: 'task_aversion',
    name: 'Task Aversion',
    shortName: 'Task Aversion',
    description: "Some tasks feel so unpleasant that avoiding them has become a relief mechanism.",
    source: 'Book 1, Chapter 2',
    icon: '🚫',
    color: 0xFFC44B4B,
  ),
  @HiveField(3)
  fearOfFailure(
    id: 'fear_of_failure',
    name: 'Fear of Failure',
    shortName: 'Fear of Failure',
    description: "Procrastination protects you from risking failure. If you never start, you never fail.",
    source: 'Book 1, Chapter 2',
    icon: '😰',
    color: 0xFF5B8EC4,
  ),
  @HiveField(4)
  fearOfSuccess(
    id: 'fear_of_success',
    name: 'Fear of Success',
    shortName: 'Fear of Success',
    description: "Success means pressure, exposure, and becoming someone unfamiliar. Your sabotage is self-protection.",
    source: 'Book 4, Chapter 1',
    icon: '🪞',
    color: 0xFF9A7124,
  ),
  @HiveField(5)
  futureSelfDisconnect(
    id: 'future_self_disconnect',
    name: 'Future Self Disconnect',
    shortName: 'Future Self Gap',
    description: "Your brain treats your future self like a stranger. Present comfort easily overrides future consequences.",
    source: 'Book 1, Chapter 3',
    icon: '👥',
    color: 0xFF7A591C,
  ),
  @HiveField(6)
  willpowerDepletion(
    id: 'willpower_depletion',
    name: 'Willpower Depletion',
    shortName: 'Depleted',
    description: "Your willpower is a finite budget. You're spending it on trivial decisions instead of what matters.",
    source: 'Book 3, Chapter 1',
    icon: '🔋',
    color: 0xFF8B3A1A,
  ),
  @HiveField(7)
  comfortZoneTrap(
    id: 'comfort_zone_trap',
    name: 'Comfort Zone Trap',
    shortName: 'Comfort Trap',
    description: "Your comfort zone isn't comfortable — it's familiar. And familiarity is not the same as wellbeing.",
    source: 'Book 5, Chapter 1',
    icon: '🛋️',
    color: 0xFF5B9E5B,
  ),
  @HiveField(8)
  attentionFragmentation(
    id: 'attention_fragmentation',
    name: 'Attention Fragmentation',
    shortName: 'Scattered',
    description: "Your attention leaks through a thousand small holes. Quick checks, notifications, open tabs.",
    source: 'Book 6, Chapter 1',
    icon: '📱',
    color: 0xFFC4652A,
  ),
  @HiveField(9)
  identityMisalignment(
    id: 'identity_misalignment',
    name: 'Identity Misalignment',
    shortName: 'Wrong Identity',
    description: "You're trying to change behaviors while still believing you're the person who doesn't do those things.",
    source: 'Book 20, Chapter 1',
    icon: '🎭',
    color: 0xFFB8892E,
  );

  const DisciplineBlock({
    required this.id,
    required this.name,
    required this.shortName,
    required this.description,
    required this.source,
    required this.icon,
    required this.color,
  });

  final String id;
  final String name;
  final String shortName;
  final String description;
  final String source;
  final String icon;
  final int color;

  static DisciplineBlock fromId(String id) {
    return DisciplineBlock.values.firstWhere((e) => e.id == id);
  }
}
