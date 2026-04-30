import 'package:hive/hive.dart';

part 'achievement.g.dart';

@HiveType(typeId: 8)
class Achievement extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String icon;

  @HiveField(4)
  final bool unlocked;

  @HiveField(5)
  final DateTime? unlockedDate;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.unlocked = false,
    this.unlockedDate,
  });

  factory Achievement.empty() {
    return Achievement(
      id: '',
      title: '',
      description: '',
      icon: '',
    );
  }
}
