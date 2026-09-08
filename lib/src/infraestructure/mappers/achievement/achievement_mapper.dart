import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class AchievementMapper {
  static domain.Achievement achievementToEntity(infra.AchievementResponse response) {
    return domain.Achievement(
      ok: response.ok,
      data: domain.DataAchievement(
        previousPageToken: response.data.previousPageToken,
        nextPageToken: response.data.nextPageToken,
        achievements: response.data.achievements.map(_itemToEntity).toList(),
      ),
    );
  }

  static domain.Achievements _itemToEntity(infra.Achievement item) {
    return domain.Achievements(
      id: item.id,
      type: item.type,
      state: item.state,
      tags: item.tags,
      name: item.rewardName,
      createdAt: item.createdAt.millisecondsSinceEpoch,
      participant: domain.Participant(
        id: item.participant.id,
        uid: item.participant.uid,
        email: item.participant.email,
        name: item.participant.name,
        avatar: '',
        state: '',
      ),
      activityFilter: item.activityFilter,
      activityTarget: item.activityTarget,
      participantMetricName: item.participantMetricName,
      participantMetricTimeframe: item.participantMetricTimeframe,
      participantMetricValue: item.participantMetricValue,
      period: item.period,
      rewardName: item.rewardName,
      rewardType: item.rewardType,
      secondaryMetricExtraPercentage: 0,
      secondaryParticipantMetricName:
          item.secondaryParticipantMetricName?.toString(),
      secondaryParticipantMetricTimeframe:
          item.secondaryParticipantMetricTimeframe?.toString(),
      secondaryRewardName: item.secondaryRewardName?.toString(),
      totalPrimaryReward: item.totalPrimaryReward,
      totalReward: item.totalReward,
      totalSecondaryReward: item.totalSecondaryReward,
      useParticipantMetrics: item.useParticipantMetrics,
      goalStartPeriod: _safeDateString(item.goalStartPeriod),
      goalEndPeriod: _safeDateString(item.goalEndPeriod),
      goal: domain.AchievementGoal(
        id: item.goalId,
        activityTarget: item.activityTarget,
        name: item.goalName,
        rewardId: null,
        imageUrl: item.goalImageUrl,
      ),
    );
  }

  static String? _safeDateString(DateTime? date) => date?.toIso8601String();
}
