import '../../entities/entities.dart';

abstract class PrizeRepository {
  Future<List<Reward>> getPrizes({
    num? page,
    num? limit,
    List<String>? tags,
    bool? redeemable,
    bool? fitsPoints,
    String? distinctId,
    Map<String, dynamic>? sort,
  });

  Future<RewardCheck> checkRedeemReward({
    required String distinctId,
    required String rewardId,
  });

  Future<RewardRedeem> rewardRedeem({
    required String distinctId,
    required String rewardId,
    Map<String, dynamic>? formData,
    String? category,
  });

  /// Genera (redime) un cupón para el premio [couponId], devolviendo el
  /// código de canje en [CouponRedeemResult.code].
  Future<CouponRedeemResult> redeemCoupon({
    required String couponId,
    required String distinctId,
  });

  /// Consulta el estado de un cupón ya redimido a partir de su [code].
  Future<CouponInfo> getCouponInfo({
    required String code,
  });
}
