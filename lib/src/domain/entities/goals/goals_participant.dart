class GoalsParticipant {
  final String id;
  final String userId;
  final String goalId;
  final String status;
  final String name;
  final String description;
  final String image;
  final String formula;
  final String activityTarget;
  final DateTime startsDate;
  final DateTime endDate;
  final String period;
  final DateTime periodBegins;
  final DateTime periodEnds;
  final String sponsorID;
  final List<String> tags;
  final List<dynamic> winningDates;
  final int winned;
  final int activityTimes;
  final int sponsorPercentage;
  final bool isEnabled;
  final bool giveNormalPoints;
  final num? participantMetricValue;
  final String rewardName;
  final Map<String, dynamic> goalData;
  final List<ConditionsGoals> conditions;

  GoalsParticipant({
    required this.id,
    required this.userId,
    required this.goalId,
    required this.status,
    required this.name,
    required this.description,
    required this.image,
    required this.formula,
    required this.activityTarget,
    required this.startsDate,
    required this.endDate,
    required this.period,
    required this.periodBegins,
    required this.periodEnds,
    required this.sponsorID,
    required this.tags,
    required this.activityTimes,
    required this.sponsorPercentage,
    required this.isEnabled,
    required this.giveNormalPoints,
    required this.winningDates,
    required this.winned,
    required this.rewardName,
    this.participantMetricValue,
    this.goalData = const {},
    this.conditions = const [],
  });
}

class ConditionsGoals {
  final String metricId;
  final String metricName;
  final String operatorMetric;
  final num valueMetric;
  final String timeframe;

  ConditionsGoals({
    required this.metricId,
    required this.metricName,
    required this.operatorMetric,
    required this.valueMetric,
    required this.timeframe,
  });
}
