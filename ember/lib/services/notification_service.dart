import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_intent_plus/android_intent_plus.dart';
import 'package:ios_torch/ios_torch.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleDailyReminder({
    required int hour,
    required int minute,
  }) async {
    const dailyReminderId = 1;
    await _notificationsPlugin.schedule(
      dailyReminderId,
      'Time for your daily protocol',
      'Ember is waiting for you. Complete your 70% standard today.',
      DateTime.now().copyWith(hour: hour, minute: minute),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          'Daily Reminder',
          channelDescription: 'Daily protocol reminder',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }

  Future<void> cancelDailyReminder() async {
    await _notificationsPlugin.cancel(1);
  }

  Future<void> showProtocolCompleteNotification() async {
    const completeId = 2;
    await _notificationsPlugin.show(
      completeId,
      'Protocol Complete!',
      'Great job completing your daily discipline session.',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'protocol_complete',
          'Protocol Complete',
          channelDescription: 'Protocol completion notification',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }
}
