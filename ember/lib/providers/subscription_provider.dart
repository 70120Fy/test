import 'package:flutter/material.dart';
import '../models/subscription_state.dart';
import '../services/storage_service.dart';

class SubscriptionProvider with ChangeNotifier {
  final StorageService _storage;
  SubscriptionState? _state;
  bool _isLoading = true;

  SubscriptionState? get state => _state;
  bool get isLoading => _isLoading;

  bool get isSubscribed => _state?.isSubscribed ?? false;
  DateTime? get trialStartDate => _state?.trialStartDate;
  DateTime? get subscriptionDate => _state?.subscriptionDate;
  String get plan => _state?.plan ?? 'placeholder';

  int get trialDaysRemaining {
    if (trialStartDate == null) return 7;
    final end = trialStartDate!.add(const Duration(days: 7));
    return end.difference(DateTime.now()).inDays;
  }

  bool get isTrialActive => trialDaysRemaining > 0 && !isSubscribed;
  bool get isTrialEnding => trialDaysRemaining <= 3 && trialDaysRemaining > 0;
  bool get isExpired => !isSubscribed && trialDaysRemaining <= 0;
  bool get hasAccess => isSubscribed || isTrialActive;

  SubscriptionProvider(this._storage);

  Future<void> initialize() async {
    _state = await _storage.getSubscriptionState();

    // Create trial on first launch
    if (_state == null) {
      _state = SubscriptionState(
        trialStartDate: DateTime.now(),
        plan: 'placeholder',
      );
      await _storage.saveSubscriptionState(_state!);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> subscribe({required String plan}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (_state == null) {
      _state = SubscriptionState(
        isSubscribed: true,
        subscriptionDate: DateTime.now(),
        plan: plan,
      );
    } else {
      _state = _state!.copyWith(
        isSubscribed: true,
        subscriptionDate: DateTime.now(),
        plan: plan,
      );
    }

    await _storage.saveSubscriptionState(_state!);
    notifyListeners();
    return true;
  }

  Future<bool> restorePurchase() async {
    // Placeholder - always return false for now
    return false;
  }

  bool canAccessProgram() {
    return hasAccess;
  }
}
