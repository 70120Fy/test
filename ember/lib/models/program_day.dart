class ProgramDay {
  final int day;
  final String title;
  final String insight;
  final String action;
  final String reflectionQuestion;

  ProgramDay({
    required this.day,
    required this.title,
    required this.insight,
    required this.action,
    required this.reflectionQuestion,
  });

  factory ProgramDay.fromJson(Map<String, dynamic> json) {
    return ProgramDay(
      day: json['day'] as int,
      title: json['title'] as String,
      insight: json['insight'] as String,
      action: json['action'] as String,
      reflectionQuestion: json['reflectionQuestion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'title': title,
      'insight': insight,
      'action': action,
      'reflectionQuestion': reflectionQuestion,
    };
  }
}
