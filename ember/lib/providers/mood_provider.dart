import 'package:flutter/material.dart';
import '../models/mood_entry.dart';
import '../services/storage_service.dart';

class MoodProvider with ChangeNotifier {
  final StorageService _storage;
  List<MoodEntry> _moodEntries = [];
  bool _isLoading = true;

  List<MoodEntry> get moodEntries => _moodEntries;
  bool get isLoading => _isLoading;

  MoodProvider(this._storage);

  Future<void> initialize() async {
    _moodEntries = await _storage.getMoodEntries();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addMoodEntry({
    required int mood,
    String? note,
  }) async {
    final entry = MoodEntry(
      date: DateTime.now(),
      mood: mood,
      note: note,
    );
    await _storage.saveMoodEntry(entry);
    _moodEntries.add(entry);
    notifyListeners();
  }

  Future<void> updateMoodEntry({
    required DateTime date,
    required int mood,
    String? note,
  }) async {
    final index = _moodEntries.indexWhere((e) => e.date.isSameDay(date));
    if (index == -1) return;

    _moodEntries[index] = MoodEntry(
      date: date,
      mood: mood,
      note: note,
    );
    await _storage.saveMoodEntry(_moodEntries[index]);
    notifyListeners();
  }

  double get averageMood {
    if (_moodEntries.isEmpty) return 0;
    final sum = _moodEntries.fold<int>(0, (sum, e) => sum + e.mood);
    return sum / _moodEntries.length;
  }

  int get totalSessions => _moodEntries.length;

  List<MoodEntry> getMoodEntriesForWeek() {
    final today = DateTime.now();
    final weekAgo = today.subtract(const Duration(days: 7));
    return _moodEntries
        .where((e) => e.date.isAfter(weekAgo))
        .toList();
  }

  List<MoodEntry> getMoodEntriesForMonth() {
    final today = DateTime.now();
    final monthAgo = today.subtract(const Duration(days: 30));
    return _moodEntries
        .where((e) => e.date.isAfter(monthAgo))
        .toList();
  }
}

extension _DateExt on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day;
  }
}
