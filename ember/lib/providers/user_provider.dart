import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../services/storage_service.dart';

class UserProvider with ChangeNotifier {
  final StorageService _storage;
  UserProfile? _profile;
  bool _isLoading = true;

  UserProfile? get profile => _profile;
  bool get isLoading => _isLoading;
  bool get hasProfile => _profile != null;
  String get name => _profile?.name ?? '';

  UserProvider(this._storage);

  Future<void> initialize() async {
    _profile = await _storage.getUserProfile();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile({String? name}) async {
    if (_profile == null) return;

    _profile = _profile!.copyWith(name: name);
    await _storage.saveUserProfile(_profile!);
    notifyListeners();
  }

  Future<void> clearProfile() async {
    _profile = null;
    notifyListeners();
  }
}
