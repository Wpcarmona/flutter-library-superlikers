import 'reward.dart';

class CouponRedemption {
  final String id;
  final String redeemId;
  final String prizeName;
  final String imageUrl;
  final int createdAt;
  final int updatedAt;
  final int points;
  final String? pointType;
  final String state;
  final bool isRedemptionCoupon;
  final String prizeDescription;
  final String code;

  CouponRedemption({
    required this.id,
    required this.redeemId,
    required this.prizeName,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.points,
    required this.pointType,
    required this.state,
    required this.isRedemptionCoupon,
    required this.prizeDescription,
    required this.code,
  });
}

class CouponRedeemResult {
  final String ok;
  final Reward coupon;
  final CouponRedemption redemption;
  final String message;

  CouponRedeemResult({
    required this.ok,
    required this.coupon,
    required this.redemption,
    required this.message,
  });

  /// Código del cupón generado, el mismo que se usa luego en [CouponInfo].
  String get code => redemption.code;
}

class CouponInfo {
  final String ok;
  final String name;
  final String state;
  final String id;
  final num prizePoints;
  final String? prizePointType;
  final String prizeName;
  final String prizeDescription;
  final String prizeImageUrl;
  final List<String> prizeTags;
  final dynamic expiresAt;

  CouponInfo({
    required this.ok,
    required this.name,
    required this.state,
    required this.id,
    required this.prizePoints,
    required this.prizePointType,
    required this.prizeName,
    required this.prizeDescription,
    required this.prizeImageUrl,
    required this.prizeTags,
    required this.expiresAt,
  });
}
