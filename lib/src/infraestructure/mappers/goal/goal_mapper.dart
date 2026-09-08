import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class GoalMapper {
  static domain.IndexGoals getGoalIndexToEntity(infra.GoalIndex goal) => domain.IndexGoals(
        id: goal.id,
        name: goal.name,
        description: goal.desc,
        image: goal.image.url,
        createAt: goal.createdAt,
        endsAt: goal.endsAt,
        activityTime: goal.activityTimes,
        brandId: goal.brandId,
        campaignId: goal.campaignId,
        delete: goal.deleted,
        enabled: goal.enabled,
        formula: goal.formula,
        sponsorName: goal.sponsorName?.toString() ?? '',
        tags: goal.tags,
        rewardName: goal.rewardName?.toString() ?? '',
        globalLimit: goal.globalLimit,
        globalAwardedCount: goal.globalAwardedCount,
        acceptancesCount: goal.acceptancesCount,
        participantMetricValue: goal.participantMetricValue,
        status: goal.status,
        goalData: goal.goalData.data,
      );

  static domain.GoalsParticipant getGoalsToEntity(infra.GoalStatus goal) => domain.GoalsParticipant(
        id: goal.id,
        userId: goal.participationId,
        goalId: goal.goalId,
        status: goal.status,
        name: goal.name,
        description: goal.desc,
        image: goal.image.url,
        formula: goal.formula,
        activityTarget: goal.activityTarget,
        activityTimes: goal.activityTimes,
        startsDate: goal.startsAt,
        endDate: goal.endsAt,
        period: goal.period,
        periodBegins: goal.startsAt,
        periodEnds: goal.endsAt,
        sponsorID: goal.sponsorId,
        tags: goal.tags,
        sponsorPercentage: goal.sponsorPercentage,
        isEnabled: goal.enabled,
        giveNormalPoints: goal.giveNormalPoints,
        winned: goal.winned,
        winningDates: goal.winningDates,
        participantMetricValue: goal.participantMetricValue,
        rewardName: goal.rewardName,
        goalData: goal.goalData,
        conditions: goal.conditionsGoals
            .map((c) => domain.ConditionsGoals(
                  metricId: c.metricId,
                  metricName: c.metricName,
                  operatorMetric: c.conditionOperator,
                  timeframe: c.timeframe,
                  valueMetric: c.value,
                ))
            .toList(),
      );

  static domain.GoalStatusInfo getGoalStatusInfoToEntity(
    infra.GoalStatusInfoResponse response,
  ) =>
      domain.GoalStatusInfo(
        ok: response.ok,
        name: response.object.name,
        status: response.object.status,
        winned: response.object.winned,
        winningDates: response.object.winningDates,
        goalId: response.object.goalId,
      );
}
