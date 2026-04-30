import 'package:flutter/material.dart';
import '../models/program.dart';
import '../models/discipline_block.dart';
import '../services/storage_service.dart';
import '../services/content_service.dart';

class ProgramProvider with ChangeNotifier {
  final StorageService _storage;
  final ContentService _contentService;

  List<Program> _programs = [];
  List<Program> _myPrograms = [];
  bool _isLoading = true;

  List<Program> get programs => _programs;
  List<Program> get myPrograms => _myPrograms;
  bool get isLoading => _isLoading;
  int get activeProgramCount => _myPrograms.where((p) => p.startedDate != null).length;

  ProgramProvider(this._storage, this._contentService);

  Future<void> initialize() async {
    await _loadPrograms();
    await _loadUserPrograms();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadPrograms() async {
    _programs = await _contentService.loadAllPrograms();
    notifyListeners();
  }

  Future<void> _loadUserPrograms() async {
    final userPrograms = await _storage.getPrograms();
    _myPrograms = userPrograms;
    notifyListeners();
  }

  Future<void> startProgram(String programId) async {
    final program = _programs.firstWhere((p) => p.id == programId);
    final userProgram = Program(
      id: program.id,
      title: program.title,
      description: program.description,
      blockId: program.blockId,
      duration: program.duration,
      outcomes: program.outcomes,
      startedDate: DateTime.now(),
    );
    await _storage.saveProgram(userProgram);
    await _loadUserPrograms();
    notifyListeners();
  }

  Future<void> completeDay(String programId, int day) async {
    final index = _myPrograms.indexWhere((p) => p.id == programId);
    if (index == -1) return;

    final program = _myPrograms[index];
    final dayProgress = _myPrograms[index].startedDate != null
        ? _myPrograms[index].startedDate!.add(Duration(days: day))
        : null;

    if (dayProgress != null) {
      await _storage.saveProgram(
        program.copyWith(
          completedDate: DateTime.now(),
        ),
      );
    }
    await _loadUserPrograms();
    notifyListeners();
  }

  Future<void> deleteProgram(String id) async {
    await _storage.deleteProgram(id);
    await _loadUserPrograms();
    notifyListeners();
  }

  Program? getProgram(String id) {
    try {
      return _programs.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  Program? getUserProgram(String id) {
    try {
      return _myPrograms.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
