import 'package:hive/hive.dart';

part 'streak_data.g.dart';

@HiveType(typeId: 6)
class StreakData extends HiveObject {
  @HiveField(0)
  final int currentStreak;

  @HiveField(1)
  final int bestStreak;

  @HiveField(2)
  final List<int> streakHistory;

  @HiveField(3)
  final DateTime lastSessionDate;

  @HiveField(4)
  final bool sessionCompletedToday;

  StreakData({
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.streakHistory = const [],
    required this.lastSessionDate,
    this.sessionCompletedToday = false,
  });

  factory StreakData.empty() {
    return StreakData(
      lastSessionDate: DateTime.now(),
    );
  }

  StreakData copyWith({
    int? currentStreak,
    int? bestStreak,
    List<int>? streakHistory,
    DateTime? lastSessionDate,
    bool? sessionCompletedToday,
  }) {
    return StreakData(
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      streakHistory: streakHistory ?? this.streakHistory,
      lastSessionDate: lastSessionDate ?? this.lastSessionDate,
      sessionCompletedToday: sessionCompletedToday ?? this.sessionCompletedToday,
    );
  }
}
