import 'package:hive/hive.dart';
import 'discipline_block.dart';
import 'willpower_type.dart';

part 'diagnostic_result.g.dart';

@HiveType(typeId: 3)
class DiagnosticResult extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final DisciplineBlock primaryBlock;

  @HiveField(2)
  final DisciplineBlock? secondaryBlock;

  @HiveField(3)
  final WillpowerType willpowerType;

  @HiveField(4)
  final Map<String, int> blockScores;

  DiagnosticResult({
    required this.date,
    required this.primaryBlock,
    this.secondaryBlock,
    required this.willpowerType,
    required this.blockScores,
  });

  factory DiagnosticResult.empty() {
    return DiagnosticResult(
      date: DateTime.now(),
      primaryBlock: DisciplineBlock.perfectionismParalysis,
      willpowerType: WillpowerType.drifter,
      blockScores: {},
    );
  }
}
