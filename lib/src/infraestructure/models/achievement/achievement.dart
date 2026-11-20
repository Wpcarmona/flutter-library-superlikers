import '../utils/json_read.dart';

class AchievementResponse {
  String ok;
  DataAchievement data;

  AchievementResponse({
    required this.ok,
    required this.data,
  });

  factory AchievementResponse.fromJson(Map<String, dynamic> json) => AchievementResponse(
        ok: readString(json["ok"]),
        data: DataAchievement.fromJson(readMap(json["data"])),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
      };
}

class DataAchievement {
  double previousPageToken;
  double nextPageToken;
  List<Achievement> achievements;

  DataAchievement({
    required this.previousPageToken,
    required this.nextPageToken,
    required this.achievements,
  });

  factory DataAchievement.fromJson(Map<String, dynamic> json) => DataAchievement(
        previousPageToken: json["previous_page_token"]?.toDouble() ?? 0.0,
        nextPageToken: json["next_page_token"]?.toDouble() ?? 0.0,
        achievements: [for (final x in (json["achievements"] is List ? json["achievements"] as List : const [])) if (x is Map) Achievement.fromJson(Map<String, dynamic>.from(x))],
      );

  Map<String, dynamic> toJson() => {
        "previous_page_token": previousPageToken,
        "next_page_token": nextPageToken,
        "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
      };
}

class Achievement {
  Map<String, dynamic> raw;

  String id;
  String type;
  String state;
  List<String> tags;
  DateTime createdAt;
  ParticipantAchievement participant;
  List<String> activityFilter;
  String activityTarget;
  dynamic consolationRewardId;
  dynamic consolationRewardName;
  dynamic consolationRewardType;
  List<dynamic> participantFilter;
  String? participantMetricName;
  String? participantMetricTimeframe;
  int? participantMetricValue;
  String period;
  dynamic primaryRewardType;
  String rewardName;
  String rewardType;
  dynamic secondaryParticipantMetricName;
  dynamic secondaryParticipantMetricTimeframe;
  dynamic secondaryRewardId;
  dynamic secondaryRewardName;
  dynamic secondaryRewardType;
  int? totalConsolationReward;
  int? totalPrimaryReward;
  int totalReward;
  int? totalSecondaryReward;
  bool useParticipantMetrics;
  DateTime? goalStartPeriod;
  DateTime? goalEndPeriod;
  String goalId;
  String goalName;
  String goalImageUrl;

  Achievement({
    this.raw = const {},
    required this.id,
    required this.type,
    required this.state,
    required this.tags,
    required this.createdAt,
    required this.participant,
    required this.activityFilter,
    required this.activityTarget,
    required this.consolationRewardId,
    required this.consolationRewardName,
    required this.consolationRewardType,
    required this.participantFilter,
    required this.participantMetricName,
    required this.participantMetricTimeframe,
    required this.participantMetricValue,
    required this.period,
    required this.primaryRewardType,
    required this.rewardName,
    required this.rewardType,
    required this.secondaryParticipantMetricName,
    required this.secondaryParticipantMetricTimeframe,
    required this.secondaryRewardId,
    required this.secondaryRewardName,
    required this.secondaryRewardType,
    required this.totalConsolationReward,
    required this.totalPrimaryReward,
    required this.totalReward,
    required this.totalSecondaryReward,
    required this.useParticipantMetrics,
    required this.goalStartPeriod,
    required this.goalEndPeriod,
    required this.goalId,
    required this.goalName,
    required this.goalImageUrl,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        raw: json,
        id: readString(json["_id"]),
        type: readString(json["_type"]),
        state: readString(json["state"]),
        tags: readStringList(json["tags"]),
        createdAt: readDate(json["created_at"]),
        participant: ParticipantAchievement.fromJson(readMap(json["participant"])),
        activityFilter: readStringList(json["activity_filter"]),
        activityTarget: readString(json["activity_target"]),
        consolationRewardId: json["consolation_reward_id"],
        consolationRewardName: json["consolation_reward_name"],
        consolationRewardType: json["consolation_reward_type"],
        participantFilter: (json["participant_filter"] is List ? List<dynamic>.from(json["participant_filter"] as List) : <dynamic>[]),
        participantMetricName: readStringOrNull(json["participant_metric_name"]),
        participantMetricTimeframe: readStringOrNull(json["participant_metric_timeframe"]),
        participantMetricValue: readIntOrNull(json["participant_metric_value"]),
        period: readString(json["period"]),
        primaryRewardType: json["primary_reward_type"],
        rewardName: readString(json["reward_name"]),
        rewardType: readString(json["reward_type"]),
        secondaryParticipantMetricName: json["secondary_participant_metric_name"],
        secondaryParticipantMetricTimeframe: json["secondary_participant_metric_timeframe"],
        secondaryRewardId: json["secondary_reward_id"],
        secondaryRewardName: json["secondary_reward_name"],
        secondaryRewardType: json["secondary_reward_type"],
        totalConsolationReward: readIntOrNull(json["total_consolation_reward"]),
        totalPrimaryReward: readIntOrNull(json["total_primary_reward"]),
        totalReward: readInt(json["total_reward"]),
        totalSecondaryReward: readIntOrNull(json["total_secondary_reward"]),
        useParticipantMetrics: readBool(json["use_participant_metrics"]),
        goalStartPeriod: json["goal_start_period"] != null ? DateTime.parse(json["goal_start_period"]) : null,
        goalEndPeriod: json["goal_end_period"] != null ? DateTime.parse(json["goal_end_period"]) : null,
        goalId: readString(json["goal_id"]),
        goalName: readString(json["goal_name"]),
        goalImageUrl: readString(json["goal_image_url"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "state": state,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "participant": participant.toJson(),
        "activity_filter": List<dynamic>.from(activityFilter.map((x) => x)),
        "activity_target": activityTarget,
        "consolation_reward_id": consolationRewardId,
        "consolation_reward_name": consolationRewardName,
        "consolation_reward_type": consolationRewardType,
        "participant_filter": List<dynamic>.from(participantFilter.map((x) => x)),
        "participant_metric_name": participantMetricName,
        "participant_metric_timeframe": participantMetricTimeframe,
        "participant_metric_value": participantMetricValue,
        "period": period,
        "primary_reward_type": primaryRewardType,
        "reward_name": rewardName,
        "reward_type": rewardType,
        "secondary_participant_metric_name": secondaryParticipantMetricName,
        "secondary_participant_metric_timeframe": secondaryParticipantMetricTimeframe,
        "secondary_reward_id": secondaryRewardId,
        "secondary_reward_name": secondaryRewardName,
        "secondary_reward_type": secondaryRewardType,
        "total_consolation_reward": totalConsolationReward,
        "total_primary_reward": totalPrimaryReward,
        "total_reward": totalReward,
        "total_secondary_reward": totalSecondaryReward,
        "use_participant_metrics": useParticipantMetrics,
        "goal_start_period": goalStartPeriod?.toIso8601String(),
        "goal_end_period": goalEndPeriod?.toIso8601String(),
        "goal_id": goalId,
        "goal_name": goalName,
        "goal_image_url": goalImageUrl,
      };
}

class ParticipantAchievement {
  String name;
  String id;
  String uid;
  String email;

  ParticipantAchievement({
    required this.name,
    required this.id,
    required this.uid,
    required this.email,
  });

  factory ParticipantAchievement.fromJson(Map<String, dynamic> json) => ParticipantAchievement(
        name: readString(json["name"]),
        id: readString(json["id"]),
        uid: readString(json["uid"]),
        email: readString(json["email"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "uid": uid,
        "email": email,
      };
}
