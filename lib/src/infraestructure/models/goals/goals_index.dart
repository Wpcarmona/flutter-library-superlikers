class GoalIndexResponse {
  String ok;
  DataGoalIndex data;

  GoalIndexResponse({
    required this.ok,
    required this.data,
  });

  factory GoalIndexResponse.fromJson(Map<String, dynamic> json) => GoalIndexResponse(
        ok: json["ok"]?.toString() ?? '',
        data: DataGoalIndex.fromJson(
          json["data"] is Map ? Map<String, dynamic>.from(json["data"] as Map) : {},
        ),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
      };
}

class DataGoalIndex {
  int page;
  int pageSize;
  int totalPages;
  int totalData;
  List<GoalIndex> goals;

  DataGoalIndex({
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.goals,
  });

  factory DataGoalIndex.fromJson(Map<String, dynamic> json) => DataGoalIndex(
        page: json["page"] ?? 0,
        pageSize: json["page_size"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        totalData: json["total_data"] ?? 0,
        goals: (json["goals"] is List)
            ? List<GoalIndex>.from(
                (json["goals"] as List).map((x) => GoalIndex.fromJson(
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
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
      };
}

class GoalIndex {
  String id;
  int acceptancesCount;
  String activityTarget;
  int activityTimes;
  bool alwaysAwardConsolationReward;
  String brandId;
  String campaignId;
  bool conditionsFailure;
  int consolationRewardAmount;
  dynamic consolationRewardId;
  dynamic consolationRewardType;
  DateTime createdAt;
  bool deleted;
  String desc;
  bool enabled;
  dynamic endedAt;
  DateTime endsAt;
  String formula;
  bool giveNormalPoints;
  int globalAwardedCount;
  int globalLimit;
  ImageGoalIndex image;
  String interval;
  int intervalSamples;
  int limit;
  String name;
  String participantMetricId;
  String participantMetricTimeframe;
  int participantMetricValue;
  String period;
  dynamic pocketId;
  bool recurrent;
  bool requiresAcceptance;
  dynamic rewardId;
  dynamic rewardType;
  int secondaryMetricExtraPercentage;
  dynamic secondaryParticipantMetricId;
  dynamic secondaryParticipantMetricTimeframe;
  dynamic secondaryPocketId;
  dynamic secondaryRewardId;
  dynamic secondaryRewardType;
  dynamic secondarySponsorId;
  int secondarySponsorPercentage;
  dynamic sponsorId;
  int sponsorPercentage;
  DateTime startsAt;
  List<String> tags;
  DateTime updatedAt;
  bool useParticipantMetrics;
  List<dynamic> filter;
  List<dynamic> participantFilter;
  List<dynamic> conditions;
  dynamic rewardName;
  dynamic sponsorName;
  dynamic pocketName;
  dynamic secondaryRewardName;
  dynamic secondarySponsorName;
  dynamic secondaryPocketName;
  dynamic consolationRewardName;
  String participantMetricName;
  dynamic secondaryParticipantMetricName;
  DateTime startPeriod;
  DateTime endPeriod;
  String status;
  GoalIndexData goalData;

  GoalIndex({
    required this.id,
    required this.acceptancesCount,
    required this.activityTarget,
    required this.activityTimes,
    required this.alwaysAwardConsolationReward,
    required this.brandId,
    required this.campaignId,
    required this.conditionsFailure,
    required this.consolationRewardAmount,
    required this.consolationRewardId,
    required this.consolationRewardType,
    required this.createdAt,
    required this.deleted,
    required this.desc,
    required this.enabled,
    required this.endedAt,
    required this.endsAt,
    required this.formula,
    required this.giveNormalPoints,
    required this.globalAwardedCount,
    required this.globalLimit,
    required this.image,
    required this.interval,
    required this.intervalSamples,
    required this.limit,
    required this.name,
    required this.participantMetricId,
    required this.participantMetricTimeframe,
    required this.participantMetricValue,
    required this.period,
    required this.pocketId,
    required this.recurrent,
    required this.requiresAcceptance,
    required this.rewardId,
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
    required this.updatedAt,
    required this.useParticipantMetrics,
    required this.filter,
    required this.participantFilter,
    required this.conditions,
    required this.rewardName,
    required this.sponsorName,
    required this.pocketName,
    required this.secondaryRewardName,
    required this.secondarySponsorName,
    required this.secondaryPocketName,
    required this.consolationRewardName,
    required this.participantMetricName,
    required this.secondaryParticipantMetricName,
    required this.startPeriod,
    required this.endPeriod,
    required this.goalData,
    required this.status,
  });

  factory GoalIndex.fromJson(Map<String, dynamic> json) => GoalIndex(
        id: json["_id"] ?? '',
        acceptancesCount: json["acceptances_count"] ?? 0,
        activityTarget: json["activity_target"] ?? '',
        activityTimes: json["activity_times"] ?? 0,
        alwaysAwardConsolationReward: json["always_award_consolation_reward"] ?? false,
        brandId: json["brand_id"] ?? '',
        campaignId: json["campaign_id"] ?? '',
        conditionsFailure: json["conditions_failure"] ?? false,
        consolationRewardAmount: json["consolation_reward_amount"] ?? 0,
        consolationRewardId: json["consolation_reward_id"],
        consolationRewardType: json["consolation_reward_type"],
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ?? DateTime(1970),
        deleted: json["deleted"] ?? false,
        desc: json["desc"] ?? '',
        enabled: json["enabled"] ?? false,
        endedAt: json["ended_at"],
        endsAt: DateTime.tryParse(json["ends_at"] ?? '') ?? DateTime(1970),
        formula: json["formula"] ?? '',
        giveNormalPoints: json["give_normal_points"] ?? false,
        globalAwardedCount: json["global_awarded_count"] ?? 0,
        globalLimit: json["global_limit"] ?? 0,
        image: ImageGoalIndex.fromJson(json["image"] ?? {}),
        interval: json["interval"] ?? '',
        intervalSamples: json["interval_samples"] ?? 0,
        limit: json["limit"] ?? 0,
        name: json["name"] ?? '',
        participantMetricId: json["participant_metric_id"]?.toString() ?? '',
        participantMetricTimeframe: json["participant_metric_timeframe"]?.toString() ?? '',
        participantMetricValue: json["participant_metric_value"] ?? 0,
        period: json["period"] ?? '',
        pocketId: json["pocket_id"],
        recurrent: json["recurrent"] ?? false,
        requiresAcceptance: json["requires_acceptance"] ?? false,
        rewardId: json["reward_id"],
        rewardType: json["reward_type"],
        secondaryMetricExtraPercentage: json["secondary_metric_extra_percentage"] ?? 0,
        secondaryParticipantMetricId: json["secondary_participant_metric_id"],
        secondaryParticipantMetricTimeframe: json["secondary_participant_metric_timeframe"],
        secondaryPocketId: json["secondary_pocket_id"],
        secondaryRewardId: json["secondary_reward_id"],
        secondaryRewardType: json["secondary_reward_type"],
        secondarySponsorId: json["secondary_sponsor_id"],
        secondarySponsorPercentage: json["secondary_sponsor_percentage"] ?? 0,
        sponsorId: json["sponsor_id"],
        sponsorPercentage: json["sponsor_percentage"] ?? 0,
        startsAt: DateTime.tryParse(json["starts_at"] ?? '') ?? DateTime(1970),
        tags: List<String>.from((json["tags"] ?? []).map((x) => x.toString())),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ?? DateTime(1970),
        useParticipantMetrics: json["use_participant_metrics"] ?? false,
        filter: List<dynamic>.from(json["filter"] ?? []),
        participantFilter: List<dynamic>.from(json["participant_filter"] ?? []),
        conditions: List<dynamic>.from(json["conditions"] ?? []),
        rewardName: json["reward_name"],
        sponsorName: json["sponsor_name"],
        pocketName: json["pocket_name"],
        secondaryRewardName: json["secondary_reward_name"],
        secondarySponsorName: json["secondary_sponsor_name"],
        secondaryPocketName: json["secondary_pocket_name"],
        consolationRewardName: json["consolation_reward_name"],
        participantMetricName: json["participant_metric_name"] ?? '',
        secondaryParticipantMetricName: json["secondary_participant_metric_name"],
        startPeriod: DateTime.tryParse(json["start_period"] ?? '') ?? DateTime(1970),
        endPeriod: DateTime.tryParse(json["end_period"] ?? '') ?? DateTime(1970),
        goalData: GoalIndexData.fromJson(json["goal_data"] ?? {}),
        status: json["status"]?.toString() ?? '0%',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "acceptances_count": acceptancesCount,
        "activity_target": activityTarget,
        "activity_times": activityTimes,
        "always_award_consolation_reward": alwaysAwardConsolationReward,
        "brand_id": brandId,
        "campaign_id": campaignId,
        "conditions_failure": conditionsFailure,
        "consolation_reward_amount": consolationRewardAmount,
        "consolation_reward_id": consolationRewardId,
        "consolation_reward_type": consolationRewardType,
        "created_at": createdAt.toIso8601String(),
        "deleted": deleted,
        "desc": desc,
        "enabled": enabled,
        "ended_at": endedAt,
        "ends_at": endsAt.toIso8601String(),
        "formula": formula,
        "give_normal_points": giveNormalPoints,
        "global_awarded_count": globalAwardedCount,
        "global_limit": globalLimit,
        "image": image.toJson(),
        "interval": interval,
        "interval_samples": intervalSamples,
        "limit": limit,
        "name": name,
        "participant_metric_id": participantMetricId,
        "participant_metric_timeframe": participantMetricTimeframe,
        "participant_metric_value": participantMetricValue,
        "period": period,
        "pocket_id": pocketId,
        "recurrent": recurrent,
        "requires_acceptance": requiresAcceptance,
        "reward_id": rewardId,
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
        "updated_at": updatedAt.toIso8601String(),
        "use_participant_metrics": useParticipantMetrics,
        "filter": List<dynamic>.from(filter.map((x) => x)),
        "participant_filter": List<dynamic>.from(participantFilter.map((x) => x)),
        "conditions": List<dynamic>.from(conditions.map((x) => x)),
        "reward_name": rewardName,
        "sponsor_name": sponsorName,
        "pocket_name": pocketName,
        "secondary_reward_name": secondaryRewardName,
        "secondary_sponsor_name": secondarySponsorName,
        "secondary_pocket_name": secondaryPocketName,
        "consolation_reward_name": consolationRewardName,
        "participant_metric_name": participantMetricName,
        "secondary_participant_metric_name": secondaryParticipantMetricName,
        "start_period": startPeriod.toIso8601String(),
        "end_period": endPeriod.toIso8601String(),
        "goal_data": goalData.toJson(),
      };
}

class GoalIndexData {
  final Map<String, dynamic> data;

  GoalIndexData({required this.data});

  factory GoalIndexData.fromJson(Map<String, dynamic> json) =>
      GoalIndexData(data: Map<String, dynamic>.from(json));

  String? get badge => data['badge']?.toString();

  Map<String, dynamic> toJson() => data;
}

class ImageGoalIndex {
  String url;

  ImageGoalIndex({
    required this.url,
  });

  factory ImageGoalIndex.fromJson(Map<String, dynamic> json) => ImageGoalIndex(
        url: json["url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
