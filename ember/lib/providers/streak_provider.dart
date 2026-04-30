import 'package:flutter/material.dart';
import '../models/streak_data.dart';
import '../services/storage_service.dart';

class StreakProvider with ChangeNotifier {
  final StorageService _storage;
  StreakData? _streak;
  bool _isLoading = true;

  StreakData? get streak => _streak;
  bool get isLoading => _isLoading;
  int get currentStreak => _streak?.currentStreak ?? 0;
  int get bestStreak => _streak?.bestStreak ?? 0;
  DateTime get lastSessionDate => _streak?.lastSessionDate ?? DateTime.now();
  bool get sessionCompletedToday => _streak?.sessionCompletedToday ?? false;

  StreakProvider(this._storage);

  Future<void> initialize() async {
    _streak = await _storage.getStreakData();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> completeSession() async {
    if (_streak == null) {
      _streak = StreakData.empty();
    }

    final today = DateTime.now();
    final last = _streak!.lastSessionDate;

    // Check if session already completed today
    if (_streak!.sessionCompletedToday) {
      notifyListeners();
      return;
    }

    final diff = today.difference(last).inDays;

    if (diff == 0) {
      // Same day, just mark completed
      _streak = _streak!.copyWith(sessionCompletedToday: true);
    } else if (diff == 1) {
      // Consecutive day
      _streak = _streak!.copyWith(
        currentStreak: _streak!.currentStreak + 1,
        lastSessionDate: today,
        sessionCompletedToday: true,
      );
    } else {
      // Streak broken, reset
      _streak = _streak!.copyWith(
        currentStreak: 1,
        lastSessionDate: today,
        sessionCompletedToday: true,
      );
    }

    // Update best streak
    if (_streak!.currentStreak > _streak!.bestStreak) {
      _streak = _streak!.copyWith(
        bestStreak: _streak!.currentStreak,
        streakHistory: [..._streak!.streakHistory, _streak!.currentStreak],
      );
    }

    await _storage.saveStreakData(_streak!);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> resetStreak() async {
    _streak = StreakData.empty();
    await _storage.saveStreakData(_streak!);
    notifyListeners();
  }

  int daysSinceLastSession() {
    final today = DateTime.now();
    final last = _streak?.lastSessionDate ?? today;
    return today.difference(last).inDays;
  }

  bool isStreakBroken() {
    return daysSinceLastSession() > 1;
  }
}
