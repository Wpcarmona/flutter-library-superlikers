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

  static domain.CouponRedeemResult couponRedeemToEntity(infra.CouponRedeemResponse response) {
    return domain.CouponRedeemResult(
      ok: response.ok,
      coupon: rewardToEntity(response.object.coupon),
      redemption: domain.CouponRedemption(
        id: response.object.redemption.id,
        redeemId: response.object.redemption.redeemId,
        prizeName: response.object.redemption.prizeName,
        imageUrl: response.object.redemption.imageUrl,
        createdAt: response.object.redemption.createdAt,
        updatedAt: response.object.redemption.updatedAt,
        points: response.object.redemption.points,
        pointType: response.object.redemption.pointType?.toString(),
        state: response.object.redemption.state,
        isRedemptionCoupon: response.object.redemption.isRedemptionCoupon,
        prizeDescription: response.object.redemption.prizeDescription,
        code: response.object.redemption.code,
      ),
      message: response.object.message,
    );
  }

  static domain.CouponInfo couponInfoToEntity(infra.CouponInfoResponse response) {
    return domain.CouponInfo(
      ok: response.ok,
      name: response.name,
      state: response.state,
      id: response.id,
      prizePoints: response.prizePoints,
      prizePointType: response.prizePointType?.toString(),
      prizeName: response.prizeName,
      prizeDescription: response.prizeDescription,
      prizeImageUrl: response.prizeImageUrl,
      prizeTags: response.prizeTags,
      expiresAt: response.expiresAt,
    );
  }
}
