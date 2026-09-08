import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class PrizesMapper {
  static domain.Reward rewardToEntity(infra.ObjectReward reward) {
    return domain.Reward(
      id: reward.id,
      type: reward.type,
      description: reward.description,
      expirationDays: reward.expirationDays,
      name: reward.name,
      points: reward.points,
      redeemable: reward.redeemable,
      tags: reward.tags,
      termsAndConditions: reward.tc,
      unlimited: reward.unlimited,
      image: reward.imageUrl,
      pointType: reward.pointType?.toString() ?? '',
      avalible: reward.available,
      redeemUrl: reward.redeemUrl,
    );
  }

  static domain.RewardCheck rewardCheckToEntity(infra.RewardCheckResponse reward) {
    return domain.RewardCheck(
      ok: reward.ok,
      isavailable: reward.data.prize.isAvailable,
      isredeemable: reward.data.prize.isRedeemable,
      isparticipantcanredeem: reward.data.participantCheck.canRedeem,
      errorParticipantCheck: reward.data.participantCheck.message,
    );
  }

  static domain.RewardRedeem rewardRedeemToEntity(infra.RewardRedeemResponse reward) {
    return domain.RewardRedeem(
      ok: reward.ok,
      message: reward.object.message,
      points: reward.object.points,
      redemptionReward: domain.RedemptionReward(
        id: reward.object.redemption.id,
        redeemId: reward.object.redemption.redeemId,
        prizesName: reward.object.redemption.prizeName,
        imageUrl: reward.object.redemption.imageUrl,
      ),
      rewardRedeem: domain.RewardDescription(
        id: reward.object.reward.id,
        name: reward.object.reward.name,
        description: reward.object.reward.description,
        redeemUrl: reward.object.reward.redeemUrl,
      ),
    );
  }
}
