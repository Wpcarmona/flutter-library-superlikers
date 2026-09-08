import '../utils/utils.dart';

class GoalParticipantResponse {
  String ok;
  DataStatus data;

  GoalParticipantResponse({required this.ok, required this.data});

  factory GoalParticipantResponse.fromJson(Map<String, dynamic> json) =>
      GoalParticipantResponse(
        ok: json["ok"]?.toString() ?? '',
        data: DataStatus.fromJson(
          json["data"] is Map ? Map<String, dynamic>.from(json["data"] as Map) : {},
        ),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "data": data.toJson()};
}

class DataStatus {
  int page;
  int pageSize;
  int totalPages;
  int totalData;
  List<GoalStatus> goalStatuses;

  DataStatus({
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.goalStatuses,
  });

  factory DataStatus.fromJson(Map<String, dynamic> json) => DataStatus(
        page: json["page"] ?? 0,
        pageSize: json["page_size"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        totalData: json["total_data"] ?? 0,
        goalStatuses: (json["goal_statuses"] is List)
            ? List<GoalStatus>.from(
                (json["goal_statuses"] as List).map((x) => GoalStatus.fromJson(
                      x is Map ? Map<String, dynamic>.from(x) : {},
                    )),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "goal_statuses": List<dynamic>.from(goalStatuses.map((x) => x.toJson())),
      };
}

class GoalStatus {
  String id;
  DateTime createdAt;
  String goalId;
  String participationId;
  String status;
  DateTime updatedAt;
  int winned;
  List<DateTime> winningDates;
  int acceptancesCount;
  String activityTarget;
  int activityTimes;
  int consolationRewardAmount;
  dynamic consolationRewardId;
  dynamic consolationRewardType;
  bool deleted;
  String desc;
  bool enabled;
  DateTime endsAt;
  DateTime? endedAt;
  String formula;
  bool giveNormalPoints;
  int globalAwardedCount;
  int globalLimit;
  Image image;
  String interval;
  int intervalSamples;
  int limit;
  dynamic missionId;
  String name;
  dynamic participantMetricId;
  dynamic participantMetricTimeframe;
  dynamic participantMetricValue;
  String period;
  String pocketId;
  bool recurrent;
  bool requiresAcceptance;
  String rewardType;
  int secondaryMetricExtraPercentage;
  dynamic secondaryParticipantMetricId;
  dynamic secondaryParticipantMetricTimeframe;
  dynamic secondaryPocketId;
  dynamic secondaryRewardId;
  dynamic secondaryRewardType;
  dynamic secondarySponsorId;
  int secondarySponsorPercentage;
  String sponsorId;
  int sponsorPercentage;
  DateTime startsAt;
  List<String> tags;
  bool useParticipantMetrics;
  String rewardName;
  Map<String, dynamic> goalData;
  List<ConditionGoals> conditionsGoals;
  String? campaignId;
  List<dynamic> conditionsProgress;
  bool alwaysAwardConsolationReward;
  bool conditionsFailure;

  GoalStatus({
    required this.id,
    required this.createdAt,
    required this.goalId,
    required this.participationId,
    required this.status,
    required this.updatedAt,
    required this.winned,
    required this.winningDates,
    required this.acceptancesCount,
    required this.activityTarget,
    required this.activityTimes,
    required this.consolationRewardAmount,
    required this.consolationRewardId,
    required this.consolationRewardType,
    required this.deleted,
    required this.desc,
    required this.enabled,
    required this.endsAt,
    required this.formula,
    required this.giveNormalPoints,
    required this.globalAwardedCount,
    required this.globalLimit,
    required this.image,
    required this.interval,
    required this.intervalSamples,
    required this.limit,
    required this.missionId,
    required this.name,
    required this.participantMetricId,
    required this.participantMetricTimeframe,
    required this.participantMetricValue,
    required this.period,
    required this.pocketId,
    required this.recurrent,
    required this.requiresAcceptance,
    required this.rewardType,
    required this.secondaryMetricExtraPercentage,
    required this.secondaryParticipantMetricId,
    required this.secondaryParticipantMetricTimeframe,
    required this.secondaryPocketId,
    required this.secondaryRewardId,
    required this.secondaryRewardType,
    required this.secondarySponsorId,
    required this.secondarySponsorPercentage,
    required this.sponsorId,
    required this.sponsorPercentage,
    required this.startsAt,
    required this.tags,
    required this.useParticipantMetrics,
    required this.rewardName,
    this.goalData = const {},
    this.conditionsGoals = const [],
    this.campaignId,
    this.endedAt,
    this.conditionsProgress = const [],
    this.alwaysAwardConsolationReward = false,
    this.conditionsFailure = false,
  });

  factory GoalStatus.fromJson(Map<String, dynamic> json) => GoalStatus(
        id: json["_id"] ?? '',
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ?? DateTime(1970),
        goalId: json["goal_id"] ?? '',
        participationId: json["participation_id"] ?? '',
        status: json["status"] ?? '',
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime(1970),
        winned: json["winned"] ?? 0,
        winningDates: List<DateTime>.from(
          (json["winning_dates"] ?? []).map(
            (x) => DateTime.tryParse(x.toString()) ?? DateTime(1970),
          ),
        ),
        acceptancesCount: json["acceptances_count"] ?? 0,
        activityTarget: json["activity_target"] ?? '',
        activityTimes: json["activity_times"] ?? 0,
        consolationRewardAmount: json["consolation_reward_amount"] ?? 0,
        consolationRewardId: json["consolation_reward_id"],
        consolationRewardType: json["consolation_reward_type"],
        deleted: json["deleted"] ?? false,
        desc: json["desc"] ?? '',
        enabled: json["enabled"] ?? false,
        endsAt: DateTime.tryParse(json["ends_at"] ?? '') ?? DateTime(1970),
        endedAt: json["ended_at"] != null ? DateTime.tryParse(json["ended_at"].toString()) : null,
        formula: json["formula"] ?? '',
        giveNormalPoints: json["give_normal_points"] ?? false,
        globalAwardedCount: json["global_awarded_count"] ?? 0,
        globalLimit: json["global_limit"] ?? 0,
        image: Image.fromJson(json["image"] ?? {}),
        interval: json["interval"] ?? '',
        intervalSamples: json["interval_samples"] ?? 0,
        limit: json["limit"] ?? 0,
        missionId: json["mission_id"],
        name: json["name"] ?? '',
        participantMetricId: json["participant_metric_id"],
        participantMetricTimeframe: json["participant_metric_timeframe"],
        participantMetricValue: json["participant_metric_value"],
        period: json["period"] ?? '',
        pocketId: json["pocket_id"] ?? '',
        recurrent: json["recurrent"] ?? false,
        requiresAcceptance: json["requires_acceptance"] ?? false,
        rewardType: json["reward_type"] ?? '',
        secondaryMetricExtraPercentage: json["secondary_metric_extra_percentage"] ?? 0,
        secondaryParticipantMetricId: json["secondary_participant_metric_id"],
        secondaryParticipantMetricTimeframe: json["secondary_participant_metric_timeframe"],
        secondaryPocketId: json["secondary_pocket_id"],
        secondaryRewardId: json["secondary_reward_id"],
        secondaryRewardType: json["secondary_reward_type"],
        secondarySponsorId: json["secondary_sponsor_id"],
        secondarySponsorPercentage: json["secondary_sponsor_percentage"] ?? 0,
        sponsorId: json["sponsor_id"] ?? '',
        sponsorPercentage: json["sponsor_percentage"] ?? 0,
        startsAt: DateTime.tryParse(json["starts_at"] ?? '') ?? DateTime(1970),
        tags: List<String>.from((json["tags"] ?? []).map((x) => x.toString())),
        useParticipantMetrics: json["use_participant_metrics"] ?? false,
        rewardName: json["reward_name"] ?? '',
        goalData: (json["goal_data"] is Map)
            ? Map<String, dynamic>.from(json["goal_data"] as Map)
            : {},
        conditionsGoals: (json["conditions"] is List)
            ? List<ConditionGoals>.from(
                json["conditions"].map((x) => ConditionGoals.fromJson(x)),
              )
            : [],
        campaignId: json["campaign_id"]?.toString(),
        conditionsProgress: (json["conditions_progress"] is List)
            ? List<dynamic>.from(json["conditions_progress"])
            : [],
        alwaysAwardConsolationReward: json["always_award_consolation_reward"] ?? false,
        conditionsFailure: json["conditions_failure"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "created_at": createdAt.toIso8601String(),
        "goal_id": goalId,
        "participation_id": participationId,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "winned": winned,
        "winning_dates": List<dynamic>.from(
          winningDates.map((x) => x.toIso8601String()),
        ),
        "acceptances_count": acceptancesCount,
        "activity_target": activityTarget,
        "activity_times": activityTimes,
        "consolation_reward_amount": consolationRewardAmount,
        "consolation_reward_id": consolationRewardId,
        "consolation_reward_type": consolationRewardType,
        "deleted": deleted,
        "desc": desc,
        "enabled": enabled,
        "ends_at": endsAt.toIso8601String(),
        "formula": formula,
        "give_normal_points": giveNormalPoints,
        "global_awarded_count": globalAwardedCount,
        "global_limit": globalLimit,
        "image": image.toJson(),
        "interval": interval,
        "interval_samples": intervalSamples,
        "limit": limit,
        "mission_id": missionId,
        "name": name,
        "participant_metric_id": participantMetricId,
        "participant_metric_timeframe": participantMetricTimeframe,
        "participant_metric_value": participantMetricValue,
        "period": period,
        "pocket_id": pocketId,
        "recurrent": recurrent,
        "requires_acceptance": requiresAcceptance,
        "reward_type": rewardType,
        "secondary_metric_extra_percentage": secondaryMetricExtraPercentage,
        "secondary_participant_metric_id": secondaryParticipantMetricId,
        "secondary_participant_metric_timeframe": secondaryParticipantMetricTimeframe,
        "secondary_pocket_id": secondaryPocketId,
        "secondary_reward_id": secondaryRewardId,
        "secondary_reward_type": secondaryRewardType,
        "secondary_sponsor_id": secondarySponsorId,
        "secondary_sponsor_percentage": secondarySponsorPercentage,
        "sponsor_id": sponsorId,
        "sponsor_percentage": sponsorPercentage,
        "starts_at": startsAt.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "use_participant_metrics": useParticipantMetrics,
        "reward_name": rewardName,
        "goal_data": goalData,
        "conditions": conditionsGoals,
        "campaign_id": campaignId,
        "ended_at": endedAt?.toIso8601String(),
        "conditions_progress": conditionsProgress,
        "always_award_consolation_reward": alwaysAwardConsolationReward,
        "conditions_failure": conditionsFailure,
      };
}

class ConditionGoals {
  String metricId;
  String metricName;
  String conditionOperator;
  int value;
  String timeframe;

  ConditionGoals({
    required this.metricId,
    required this.metricName,
    required this.conditionOperator,
    required this.value,
    required this.timeframe,
  });

  factory ConditionGoals.fromJson(Map<String, dynamic> json) => ConditionGoals(
        metricId: json["metric_id"]?.toString() ?? '',
        metricName: json["metric_name"]?.toString() ?? '',
        conditionOperator: json["operator"]?.toString() ?? '',
        value: (json["value"] as num?)?.toInt() ?? 0,
        timeframe: json["timeframe"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "metric_id": metricId,
        "metric_name": metricName,
        "operator": conditionOperator,
        "value": value,
        "timeframe": timeframe,
      };
}
