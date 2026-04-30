import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OnboardingProvider with ChangeNotifier {
  static const String _onboardingBox = 'onboarding';
  static const String _completedKey = 'completed';

  bool _isCompleted = false;
  bool _isLoading = true;

  bool get isCompleted => _isCompleted;
  bool get isLoading => _isLoading;
  bool get shouldShowOnboarding => !_isCompleted;

  Future<void> initialize() async {
    final box = await Hive.openBox(_onboardingBox);
    _isCompleted = box.get(_completedKey, defaultValue: false);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    final box = await Hive.openBox(_onboardingBox);
    await box.put(_completedKey, true);
    _isCompleted = true;
    notifyListeners();
  }
}
