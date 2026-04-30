import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  bool _notificationsEnabled = true;
  int _reminderHour = 7;
  int _reminderMinute = 0;
  bool _hapticsEnabled = true;
  bool _soundsEnabled = true;

  bool get notificationsEnabled => _notificationsEnabled;
  int get reminderHour => _reminderHour;
  int get reminderMinute => _reminderMinute;
  bool get hapticsEnabled => _hapticsEnabled;
  bool get soundsEnabled => _soundsEnabled;

  String get reminderTime => '${_reminderHour}:${_reminderMinute.toString().padLeft(2, '0')}';

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }

  void setReminderTime(int hour, int minute) {
    _reminderHour = hour;
    _reminderMinute = minute;
    notifyListeners();
  }

  void toggleHaptics() {
    _hapticsEnabled = !_hapticsEnabled;
    notifyListeners();
  }

  void toggleSounds() {
    _soundsEnabled = !_soundsEnabled;
    notifyListeners();
  }
}
