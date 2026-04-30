import 'package:hive/hive.dart';

part 'subscription_state.g.dart';

@HiveType(typeId: 7)
class SubscriptionState extends HiveObject {
  @HiveField(0)
  final bool isSubscribed;

  @HiveField(1)
  final DateTime? trialStartDate;

  @HiveField(2)
  final DateTime? subscriptionDate;

  @HiveField(3)
  final String plan;

  int get trialDaysRemaining {
    if (trialStartDate == null) return 0;
    final end = trialStartDate!.add(const Duration(days: 7));
    return max(0, end.difference(DateTime.now()).inDays);
  }

  bool get isTrialActive => trialDaysRemaining > 0 && !isSubscribed;
  bool get isExpired => !isSubscribed && trialDaysRemaining == 0;
  bool get hasAccess => isSubscribed || isTrialActive;

  SubscriptionState({
    this.isSubscribed = false,
    this.trialStartDate,
    this.subscriptionDate,
    this.plan = 'placeholder',
  });

  factory SubscriptionState.empty() {
    return SubscriptionState(
      trialStartDate: DateTime.now(),
    );
  }
}

int max(int a, int b) => a > b ? a : b;
