import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';
import '../models/program_day.dart';
import '../models/discipline_block.dart';

class ContentService {
  static const String _programsPath = 'data/programs/';
  static const String _questionsPath = 'data/questions.json';

  List<Map<String, dynamic>> _questions = [];
  List<Program> _programs = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get questions => _questions;
  List<Program> get programs => _programs;
  bool get isLoading => _isLoading;

  Future<void> initialize() async {
    await Future.wait([
      _loadQuestions(),
      _loadPrograms(),
    ]);
    _isLoading = false;
  }

  Future<void> _loadQuestions() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    if (!manifest.contains(_questionsPath)) {
      _questions = [];
      return;
    }

    final json = await rootBundle.loadString(_questionsPath);
    final data = jsonDecode(json) as Map<String, dynamic>;
    _questions = List<Map<String, dynamic>>.from(data['questions'] ?? []);
  }

  Future<void> _loadPrograms() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');

    final programsDir = Directory(_programsPath);
    final files = programsDir.listSync()
        .where((f) => f.path.endsWith('.json'))
        .map((f) => f.path.split('/').last)
        .toList();

    for (final file in files) {
      final json = await rootBundle.loadString('$_programsPath$file');
      final data = jsonDecode(json) as Map<String, dynamic>;
      final program = _parseProgram(data, file);
      _programs.add(program);
    }
  }

  Program _parseProgram(Map<String, dynamic> data, String fileName) {
    final programId = fileName.replaceFirst('.json', '');
    final days = (data['days'] as List)
        .map((d) => ProgramDay.fromJson(d))
        .toList();

    return Program(
      id: programId,
      title: data['title'] as String,
      description: data['description'] as String,
      blockId: data['blockId'] as String,
      duration: data['duration'] as int,
      outcomes: (data['outcomes'] as List)
          .map((e) => e as String)
          .toList(),
      days: days,
    );
  }

  Program? getProgram(String id) {
    try {
      return _programs.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Program> getProgramsByBlock(String blockId) {
    return _programs.where((p) => p.blockId == blockId).toList();
  }

  ProgramDay? getProgramDay(String programId, int day) {
    final program = getProgram(programId);
    if (program == null) return null;
    try {
      return program.days.firstWhere((d) => d.day == day);
    } catch (e) {
      return null;
    }
  }

  DisciplineBlock? getBlockForProgram(String programId) {
    final program = getProgram(programId);
    if (program == null) return null;
    try {
      return DisciplineBlock.values
          .firstWhere((b) => b.id == program.blockId);
    } catch (e) {
      return null;
    }
  }
}
