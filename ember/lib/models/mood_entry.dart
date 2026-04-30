import 'package:hive/hive.dart';

part 'mood_entry.g.dart';

@HiveType(typeId: 5)
class MoodEntry extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final int mood;

  @HiveField(2)
  final String? note;

  MoodEntry({
    required this.date,
    required this.mood,
    this.note,
  });

  factory MoodEntry.empty() {
    return MoodEntry(
      date: DateTime.now(),
      mood: 0,
    );
  }

  int get moodValue {
    switch (mood) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 4;
      default:
        return 0;
    }
  }

  String get moodLabel {
    switch (mood) {
      case 1:
        return 'Hard';
      case 2:
        return 'Meh';
      case 3:
        return 'Weird';
      case 4:
        return 'Free';
      default:
        return 'Unknown';
    }
  }
}
