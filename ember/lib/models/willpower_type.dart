import 'package:hive/hive.dart';

part 'willpower_type.g.dart';

@HiveType(typeId: 1)
enum WillpowerType {
  @HiveField(0)
  sprinter(
    id: 'sprinter',
    name: 'The Sprinter',
    description: "Bursts of incredible intensity followed by complete collapse. You confuse intensity with discipline.",
    source: 'Book 3, Chapter 3',
  ),
  @HiveField(1)
  drifter(
    id: 'drifter',
    name: 'The Drifter',
    description: "Average willpower applied randomly. You resist some temptations and give in to others with no pattern.",
    source: 'Book 3, Chapter 3',
  ),
  @HiveField(2)
  architect(
    id: 'architect',
    name: 'The Architect',
    description: "Strategic and systematic. You design environments that require less willpower, not more.",
    source: 'Book 3, Chapter 3',
  );

  const WillpowerType({
    required this.id,
    required this.name,
    required this.description,
    required this.source,
  });

  final String id;
  final String name;
  final String description;
  final String source;

  static WillpowerType fromId(String id) {
    return WillpowerType.values.firstWhere((e) => e.id == id);
  }
}
