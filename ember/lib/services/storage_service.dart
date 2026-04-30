import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../models/discipline_block.dart';
import '../models/willpower_type.dart';
import '../models/user_profile.dart';
import '../models/diagnostic_result.dart';
import '../models/program.dart';
import '../models/mood_entry.dart';
import '../models/streak_data.dart';
import '../models/subscription_state.dart';
import '../models/achievement.dart';

class StorageService {
  static const String _userProfileBox = 'userProfile';
  static const String _diagnosticResultBox = 'diagnosticResult';
  static const String _programBox = 'programs';
  static const String _moodEntryBox = 'moodEntries';
  static const String _streakBox = 'streakData';
  static const String _subscriptionBox = 'subscriptionState';
  static const String _achievementBox = 'achievements';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserProfileAdapter());
    Hive.registerAdapter(DiagnosticResultAdapter());
    Hive.registerAdapter(ProgramAdapter());
    Hive.registerAdapter(MoodEntryAdapter());
    Hive.registerAdapter(StreakDataAdapter());
    Hive.registerAdapter(SubscriptionStateAdapter());
    Hive.registerAdapter(AchievementAdapter());
    Hive.registerAdapter(DisciplineBlockAdapter());
    Hive.registerAdapter(WillpowerTypeAdapter());
  }

  // User Profile
  Future<UserProfile?> getUserProfile() async {
    final box = await Hive.openBox<UserProfile>(_userProfileBox);
    return box.values.firstOrNull;
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    final box = await Hive.openBox<UserProfile>(_userProfileBox);
    await box.put('profile', profile);
  }

  // Diagnostic Result
  Future<DiagnosticResult?> getDiagnosticResult() async {
    final box = await Hive.openBox<DiagnosticResult>(_diagnosticResultBox);
    return box.values.firstOrNull;
  }

  Future<void> saveDiagnosticResult(DiagnosticResult result) async {
    final box = await Hive.openBox<DiagnosticResult>(_diagnosticResultBox);
    await box.put('result', result);
  }

  // Programs
  Future<List<Program>> getPrograms() async {
    final box = await Hive.openBox<Program>(_programBox);
    return box.values.toList();
  }

  Future<void> saveProgram(Program program) async {
    final box = await Hive.openBox<Program>(_programBox);
    await box.put(program.id, program);
  }

  Future<void> deleteProgram(String id) async {
    final box = await Hive.openBox<Program>(_programBox);
    await box.delete(id);
  }

  // Mood Entries
  Future<List<MoodEntry>> getMoodEntries() async {
    final box = await Hive.openBox<MoodEntry>(_moodEntryBox);
    return box.values.toList();
  }

  Future<void> saveMoodEntry(MoodEntry entry) async {
    final box = await Hive.openBox<MoodEntry>(_moodEntryBox);
    await box.put(entry.date.toIso8601String(), entry);
  }

  // Streak Data
  Future<StreakData?> getStreakData() async {
    final box = await Hive.openBox<StreakData>(_streakBox);
    return box.values.firstOrNull;
  }

  Future<void> saveStreakData(StreakData streak) async {
    final box = await Hive.openBox<StreakData>(_streakBox);
    await box.put('streak', streak);
  }

  // Subscription State
  Future<SubscriptionState?> getSubscriptionState() async {
    final box = await Hive.openBox<SubscriptionState>(_subscriptionBox);
    return box.values.firstOrNull;
  }

  Future<void> saveSubscriptionState(SubscriptionState state) async {
    final box = await Hive.openBox<SubscriptionState>(_subscriptionBox);
    await box.put('subscription', state);
  }

  // Achievements
  Future<List<Achievement>> getAchievements() async {
    final box = await Hive.openBox<Achievement>(_achievementBox);
    return box.values.toList();
  }

  Future<void> saveAchievement(Achievement achievement) async {
    final box = await Hive.openBox<Achievement>(_achievementBox);
    await box.put(achievement.id, achievement);
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
