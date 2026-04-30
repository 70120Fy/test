import 'package:flutter/material.dart';
import '../models/discipline_block.dart';
import '../models/diagnostic_result.dart';
import '../models/willpower_type.dart';
import '../services/storage_service.dart';

class DiagnosticProvider with ChangeNotifier {
  final StorageService _storage;

  List<Map<String, dynamic>> _questions = [];
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> _answers = [];
  DiagnosticResult? _result;
  bool _isLoading = false;

  List<Map<String, dynamic>> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  Map<String, dynamic>? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;
  List<Map<String, dynamic>> get answers => _answers;
  DiagnosticResult? get result => _result;
  bool get isLoading => _isLoading;
  bool get hasCompletedQuiz => _answers.length == _questions.length;
  bool get hasResult => _result != null;

  DiagnosticProvider(this._storage);

  Future<void> initialize() async {
    await _loadQuestions();
    final result = await _storage.getDiagnosticResult();
    _result = result;
    notifyListeners();
  }

  Future<void> _loadQuestions() async {
    _questions = [
      {
        "id": "q1",
        "text": "When you procrastinate, what's usually happening inside?",
        "answers": [
          {"id": "a", "text": "The task feels genuinely unpleasant to do", "mapsTo": ["taskAversion"]},
          {"id": "b", "text": "I can't figure out where to start — it all feels like too much", "mapsTo": ["overwhelmParalysis"]},
          {"id": "c", "text": "I'm worried the result won't be good enough", "mapsTo": ["perfectionismParalysis"]},
          {"id": "d", "text": "I'm scared of what happens if I try and fail", "mapsTo": ["fear_of_failure"]}
        ]
      },
      {
        "id": "q2",
        "text": "You set a big goal. What happens next?",
        "answers": [
          {"id": "a", "text": "I attack it with extreme intensity for about 2 weeks, then completely stop", "mapsTo": ["willpower_depletion"], "willpowerType": "sprinter"},
          {"id": "b", "text": "I work on it when I feel motivated, which is unpredictable", "mapsTo": ["identity_misalignment"], "willpowerType": "drifter"},
          {"id": "c", "text": "I break it into small systems before I start, then follow the system", "mapsTo": [], "willpowerType": "architect"},
          {"id": "d", "text": "I plan extensively but struggle to start the actual work", "mapsTo": ["perfectionismParalysis"]}
        ]
      },
      {
        "id": "q3",
        "text": "When you get close to achieving something, you tend to...",
        "answers": [
          {"id": "a", "text": "Feel anxious about the expectations that come with success", "mapsTo": ["fear_of_success"]},
          {"id": "b", "text": "Lose interest and start something new", "mapsTo": ["fear_of_success", "identity_misalignment"]},
          {"id": "c", "text": "Find yourself making careless mistakes out of nowhere", "mapsTo": ["fear_of_success"]},
          {"id": "d", "text": "Push through to the finish with relief", "mapsTo": []}
        ]
      },
      {
        "id": "q4",
        "text": "How do you feel about your future self?",
        "answers": [
          {"id": "a", "text": "Like a stranger — I can't really picture who they'll be", "mapsTo": ["future_self_disconnect"]},
          {"id": "b", "text": "Like a burden — they'll have to deal with my current choices", "mapsTo": ["future_self_disconnect"]},
          {"id": "c", "text": "Like a project — I'm actively building them", "mapsTo": []},
          {"id": "d", "text": "Like a fantasy — I imagine them but don't connect it to today", "mapsTo": ["future_self_disconnect"]}
        ]
      },
      {
        "id": "q5",
        "text": "By 6 PM, you can't seem to make yourself do anything. Why?",
        "answers": [
          {"id": "a", "text": "I've been making decisions all day — I'm mentally drained", "mapsTo": ["willpower_depletion"]},
          {"id": "b", "text": "I've been resisting temptations all day — I'm out of self-control", "mapsTo": ["willpower_depletion"]},
          {"id": "c", "text": "I didn't sleep well or eat properly — my body is running on empty", "mapsTo": ["willpower_depletion"]},
          {"id": "d", "text": "I don't have this problem — I maintain energy all day", "mapsTo": []}
        ]
      },
      {
        "id": "q6",
        "text": "What does 'success' secretly feel like to you?",
        "answers": [
          {"id": "a", "text": "Pressure — more expectations, more to maintain", "mapsTo": ["fear_of_success"]},
          {"id": "b", "text": "Exposure — people will see me and judge me", "mapsTo": ["fear_of_success", "perfectionismParalysis"]},
          {"id": "c", "text": "Loss — I'll outgrow my current relationships", "mapsTo": ["fear_of_success", "comfort_zone_trap"]},
          {"id": "d", "text": "Freedom — I'll have more options and control", "mapsTo": []}
        ]
      },
      {
        "id": "q7",
        "text": "How often do you check your phone during focused work?",
        "answers": [
          {"id": "a", "text": "Constantly — almost without thinking, like a reflex", "mapsTo": ["attention_fragmentation"]},
          {"id": "b", "text": "Every 20-30 minutes — I tell myself it's just a quick check", "mapsTo": ["attention_fragmentation"]},
          {"id": "c", "text": "Rarely — I put my phone away when I need to focus", "mapsTo": []},
          {"id": "d", "text": "I don't really do focused work — I'm always multitasking", "mapsTo": ["attention_fragmentation", "willpower_depletion"]}
        ]
      },
      {
        "id": "q8",
        "text": "When someone suggests you try something new, your first reaction is...",
        "answers": [
          {"id": "a", "text": "Interest — I love trying new things", "mapsTo": []},
          {"id": "b", "text": "Hesitation — what if I'm bad at it?", "mapsTo": ["perfectionismParalysis", "fear_of_failure"]},
          {"id": "c", "text": "Resistance — I'm fine with how things are", "mapsTo": ["comfort_zone_trap"]},
          {"id": "d", "text": "Excitement — but I rarely follow through", "mapsTo": ["identity_misalignment"]}
        ]
      },
      {
        "id": "q9",
        "text": "Which statement feels most true about you?",
        "answers": [
          {"id": "a", "text": "I know exactly what I should do, I just can't make myself do it", "mapsTo": ["willpower_depletion"]},
          {"id": "b", "text": "I'm not sure what I should do — everything feels equally important", "mapsTo": ["overwhelmParalysis"]},
          {"id": "c", "text": "I start things with enthusiasm but lose steam quickly", "mapsTo": ["identity_misalignment", "willpower_depletion"]},
          {"id": "d", "text": "I avoid starting because I know I won't finish", "mapsTo": ["fear_of_failure"]}
        ]
      },
      {
        "id": "q10",
        "text": "You just got a compliment on your work. What do you feel?",
        "answers": [
          {"id": "a", "text": "Proud — I worked hard on this", "mapsTo": []},
          {"id": "b", "text": "Anxious — now they expect this every time", "mapsTo": ["perfectionismParalysis", "fear_of_success"]},
          {"id": "c", "text": "Suspicious — they're just being nice, it's not that good", "mapsTo": ["fear_of_success"]},
          {"id": "d", "text": "Empty — the compliment doesn't feel real to me", "mapsTo": ["identity_misalignment"]}
        ]
      },
      {
        "id": "q11",
        "text": "Your life right now could be described as...",
        "answers": [
          {"id": "a", "text": "Comfortable but stagnant — nothing changes", "mapsTo": ["comfort_zone_trap"]},
          {"id": "b", "text": "Chaotic but moving — lots of starts and stops", "mapsTo": ["willpower_depletion"]},
          {"id": "c", "text": "Structured and growing — I have systems in place", "mapsTo": []},
          {"id": "d", "text": "Frustrating — I know I'm capable of more", "mapsTo": ["identity_misalignment"]}
        ]
      },
      {
        "id": "q12",
        "text": "What would you do if you knew you couldn't fail?",
        "answers": [
          {"id": "a", "text": "Exactly what I'm doing now, but with more confidence", "mapsTo": ["fear_of_failure"]},
          {"id": "b", "text": "Something completely different from my current path", "mapsTo": ["fear_of_failure", "comfort_zone_trap"]},
          {"id": "c", "text": "The same things — failure isn't what holds me back", "mapsTo": []},
          {"id": "d", "text": "I genuinely don't know — I've never let myself imagine it", "mapsTo": ["fear_of_failure", "fear_of_success"]}
        ]
      },
      {
        "id": "q13",
        "text": "How do you handle a task you've been avoiding?",
        "answers": [
          {"id": "a", "text": "I make it as small as possible — just open the document", "mapsTo": ["overwhelmParalysis"]},
          {"id": "b", "text": "I pair it with something enjoyable — coffee shop + hard task", "mapsTo": ["taskAversion"]},
          {"id": "c", "text": "I tell myself it doesn't have to be good — just done", "mapsTo": ["perfectionismParalysis"]},
          {"id": "d", "text": "I usually keep avoiding it until a deadline forces me", "mapsTo": ["willpower_depletion", "future_self_disconnect"]}
        ]
      },
      {
        "id": "q14",
        "text": "When you try to build a new habit, what usually goes wrong?",
        "answers": [
          {"id": "a", "text": "I start too big and burn out after a week", "mapsTo": ["willpower_depletion"]},
          {"id": "b", "text": "I miss one day and feel like it's ruined — then I quit", "mapsTo": ["perfectionismParalysis"]},
          {"id": "c", "text": "I do it for a while but it never feels natural — like I'm forcing it", "mapsTo": ["identity_misalignment"]},
          {"id": "d", "text": "Life gets busy and I just... stop. No particular reason.", "mapsTo": ["comfort_zone_trap"]}
        ]
      },
      {
        "id": "q15",
        "text": "Deep down, what do you believe about yourself?",
        "answers": [
          {"id": "a", "text": "I'm capable but undisciplined — if I could just get my act together", "mapsTo": ["willpower_depletion", "identity_misalignment"]},
          {"id": "b", "text": "I'm talented but broken — something inside me blocks my potential", "mapsTo": ["fear_of_success", "fear_of_failure"]},
          {"id": "c", "text": "I'm comfortable but stuck — I've settled for less than I want", "mapsTo": ["comfort_zone_trap"]},
          {"id": "d", "text": "I'm becoming someone — I'm in process and that's okay", "mapsTo": []}
        ]
      },
    ];
    notifyListeners();
  }

  void answerQuestion(String answerId, Map<String, dynamic> answer) {
    _answers.add({
      'questionId': currentQuestion?['id'],
      'answerId': answerId,
      'mapsTo': answer['mapsTo'] ?? [],
      'willpowerType': answer['willpowerType'] as String?,
    });
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  int calculateBlockScore(String blockId) {
    return _answers.where((a) {
      final mapsTo = List<String>.from(a['mapsTo'] ?? []);
      return mapsTo.contains(blockId);
    }).length;
  }

  Map<String, int> calculateAllBlockScores() {
    final blockIds = DisciplineBlock.values.map((e) => e.id).toList();
    return {for (var id in blockIds) id: calculateBlockScore(id)};
  }

  WillpowerType determineWillpowerType() {
    final typeCounts = <String, int>{'sprinter': 0, 'drifter': 0, 'architect': 0};

    for (final answer in _answers) {
      final wt = answer['willpowerType'] as String?;
      if (wt != null) {
        typeCounts[wt] = (typeCounts[wt] ?? 0) + 1;
      }
    }

    if (typeCounts.values.every((c) => c == 0)) return WillpowerType.drifter;

    final maxEntry = typeCounts.entries.reduce(
      (a, b) => a.value >= b.value ? a : b,
    );

    return WillpowerType.fromId(maxEntry.key);
  }

  Future<void> completeQuiz() async {
    _isLoading = true;
    notifyListeners();

    final blockScores = calculateAllBlockScores();

    final primaryBlock = DisciplineBlock.values.reduce((a, b) =>
        blockScores[a.id]! > blockScores[b.id]! ? a : b);

    DisciplineBlock? secondaryBlock;
    if (DisciplineBlock.values.length > 1) {
      final sortedBlocks = DisciplineBlock.values.toList()
        ..sort((a, b) => (blockScores[b.id] ?? 0).compareTo(blockScores[a.id] ?? 0));
      if (sortedBlocks[0] == primaryBlock && sortedBlocks.length > 1) {
        secondaryBlock = sortedBlocks[1];
      }
    }

    final willpowerType = determineWillpowerType();

    _result = DiagnosticResult(
      date: DateTime.now(),
      primaryBlock: primaryBlock,
      secondaryBlock: secondaryBlock,
      willpowerType: willpowerType,
      blockScores: blockScores,
    );

    await _storage.saveDiagnosticResult(_result!);
    _isLoading = false;
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _answers = [];
    notifyListeners();
  }
}
