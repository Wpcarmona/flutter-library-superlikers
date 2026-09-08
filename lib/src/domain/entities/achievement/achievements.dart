import '../participant/participant.dart';

class Achievement {
  final String ok;
  final DataAchievement data;

  Achievement({
    required this.ok,
    required this.data,
  });
}

class DataAchievement {
  final num previousPageToken;
  final num nextPageToken;
  final List<Achievements> achievements;

  DataAchievement({
    required this.previousPageToken,
    required this.nextPageToken,
    required this.achievements,
  });
}

class Achievements {
  final String id;
  final String type;
  final String state;
  final List<String> tags;
  final String name;
  final num createdAt;
  final Participant participant;
  final List<String> activityFilter;
  final String activityTarget;
  final String? participantMetricName;
  final String? participantMetricTimeframe;
  final num? participantMetricValue;
  final String period;
  final String rewardName;
  final String rewardType;
  final num secondaryMetricExtraPercentage;
  final String? secondaryParticipantMetricName;
  final String? secondaryParticipantMetricTimeframe;
  final String? secondaryRewardName;
  final num? totalPrimaryReward;
  final num totalReward;
  final num? totalSecondaryReward;
  final bool useParticipantMetrics;
  final String? goalStartPeriod;
  final String? goalEndPeriod;
  final AchievementGoal goal;

  Achievements({
    required this.id,
    required this.type,
    required this.state,
    required this.tags,
    required this.name,
    required this.createdAt,
    required this.participant,
    required this.activityFilter,
    required this.activityTarget,
    required this.participantMetricName,
    required this.participantMetricTimeframe,
    required this.participantMetricValue,
    required this.period,
    required this.rewardName,
    required this.rewardType,
    required this.secondaryMetricExtraPercentage,
    this.secondaryParticipantMetricName,
    this.secondaryParticipantMetricTimeframe,
    this.secondaryRewardName,
    this.totalPrimaryReward,
    required this.totalReward,
    this.totalSecondaryReward,
    required this.useParticipantMetrics,
    this.goalStartPeriod,
    this.goalEndPeriod,
    required this.goal,
  });
}

class AchievementGoal {
  final String id;
  final String activityTarget;
  final String name;
  final String? rewardId;
  final String? imageUrl;

  AchievementGoal({
    required this.id,
    required this.activityTarget,
    required this.name,
    this.rewardId,
    this.imageUrl,
  });
}
