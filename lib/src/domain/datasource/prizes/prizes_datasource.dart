import '../../entities/entities.dart';

abstract class PrizesDatasource {
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
  /// [opts] se envía tal cual al proveedor del cupón (p. ej. la marca o
  /// sucursal elegida con [getCouponExternalData]).
  Future<CouponRedeemResult> redeemCoupon({
    required String couponId,
    required String distinctId,
    Map<String, dynamic>? opts,
  });

  /// Datos externos de un cupón (`POST /coupons/{couponId}/external/{key}`),
  /// p. ej. las opciones que el proveedor pide elegir antes de generarlo.
  /// [opts] se envía tal cual al proveedor.
  Future<CouponExternalData> getCouponExternalData({
    required String couponId,
    required String key,
    Map<String, dynamic>? opts,
  });

  /// Consulta el estado de un cupón ya redimido a partir de su [code].
  Future<CouponInfo> getCouponInfo({
    required String code,
  });
}
