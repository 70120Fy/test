import 'storage_service.dart';
import '../models/subscription_state.dart';

class SubscriptionService {
  final StorageService _storage;

  SubscriptionService(this._storage);

  Future<void> checkSubscription() async {
    final state = await _storage.getSubscriptionState();

    if (state == null) {
      await _storage.saveSubscriptionState(
        SubscriptionState(trialStartDate: DateTime.now()),
      );
      return;
    }

    if (state.isExpired) {
      return;
    }

    if (state.isTrialActive && state.trialDaysRemaining <= 3) {
      return;
    }
  }

  Future<bool> subscribe({required String plan}) async {
    await Future.delayed(const Duration(seconds: 2));

    final state = await _storage.getSubscriptionState();
    if (state == null) return false;

    await _storage.saveSubscriptionState(
      state.copyWith(
        isSubscribed: true,
        subscriptionDate: DateTime.now(),
        plan: plan,
      ),
    );

    return true;
  }

  Future<bool> restorePurchase() async {
    final state = await _storage.getSubscriptionState();
    return state?.isSubscribed == true;
  }
}
