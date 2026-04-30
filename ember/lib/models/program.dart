import 'package:hive/hive.dart';
import 'program_day.dart';

part 'program.g.dart';

@HiveType(typeId: 4)
class Program extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String blockId;

  @HiveField(4)
  final int duration;

  @HiveField(5)
  final List<String> outcomes;

  @HiveField(6)
  final List<ProgramDay> days;

  @HiveField(7)
  final DateTime? startedDate;

  @HiveField(8)
  final DateTime? completedDate;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.blockId,
    required this.duration,
    required this.outcomes,
    required this.days,
    this.startedDate,
    this.completedDate,
  });

  factory Program.empty() {
    return Program(
      id: '',
      title: '',
      description: '',
      blockId: '',
      duration: 0,
      outcomes: [],
      days: [],
    );
  }

  Program copyWith({
    String? id,
    String? title,
    String? description,
    String? blockId,
    int? duration,
    List<String>? outcomes,
    List<ProgramDay>? days,
    DateTime? startedDate,
    DateTime? completedDate,
  }) {
    return Program(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      blockId: blockId ?? this.blockId,
      duration: duration ?? this.duration,
      outcomes: outcomes ?? this.outcomes,
      days: days ?? this.days,
      startedDate: startedDate ?? this.startedDate,
      completedDate: completedDate ?? this.completedDate,
    );
  }

  int get completedDays {
    if (startedDate == null) return 0;
    final today = DateTime.now();
    final start = startedDate!;
    final diff = today.difference(start).inDays;
    return diff >= duration ? duration : diff;
  }

  double get progress {
    if (duration == 0) return 0;
    return completedDays / duration;
  }
}
