import 'reward.dart' show ObjectReward;

class CouponRedeemResponse {
  String ok;
  CouponRedeemObject object;

  CouponRedeemResponse({
    required this.ok,
    required this.object,
  });

  factory CouponRedeemResponse.fromJson(Map<String, dynamic> json) =>
      CouponRedeemResponse(
        ok: json["ok"] ?? '',
        object: CouponRedeemObject.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "object": object.toJson(),
      };
}

class CouponRedeemObject {
  ObjectReward coupon;
  CouponRedemption redemption;
  String message;

  CouponRedeemObject({
    required this.coupon,
    required this.redemption,
    required this.message,
  });

  factory CouponRedeemObject.fromJson(Map<String, dynamic> json) =>
      CouponRedeemObject(
        coupon: ObjectReward.fromJson(json["coupon"]),
        redemption: CouponRedemption.fromJson(json["redemption"]),
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "coupon": coupon.toJson(),
        "redemption": redemption.toJson(),
        "message": message,
      };
}

class CouponRedemption {
  String id;
  String redeemId;
  String prizeName;
  String imageUrl;
  int createdAt;
  int updatedAt;
  int points;
  dynamic pointType;
  String state;
  bool isRedemptionCoupon;
  String prizeDescription;
  String code;

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

  factory CouponRedemption.fromJson(Map<String, dynamic> json) =>
      CouponRedemption(
        id: json["_id"] ?? '',
        redeemId: json["redeem_id"] ?? '',
        prizeName: json["prize_name"] ?? '',
        imageUrl: json["image_url"] ?? '',
        createdAt: json["created_at"] ?? 0,
        updatedAt: json["updated_at"] ?? 0,
        points: json["points"] ?? 0,
        pointType: json["point_type"],
        state: json["state"] ?? '',
        isRedemptionCoupon: json["is_redemption_coupon"] ?? false,
        prizeDescription: json["prize_description"] ?? '',
        code: json["code"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "redeem_id": redeemId,
        "prize_name": prizeName,
        "image_url": imageUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "points": points,
        "point_type": pointType,
        "state": state,
        "is_redemption_coupon": isRedemptionCoupon,
        "prize_description": prizeDescription,
        "code": code,
      };
}

class CouponInfoResponse {
  String ok;
  String name;
  String state;
  String id;
  num prizePoints;
  dynamic prizePointType;
  String prizeName;
  String prizeDescription;
  String prizeImageUrl;
  List<String> prizeTags;
  dynamic expiresAt;

  CouponInfoResponse({
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

  factory CouponInfoResponse.fromJson(Map<String, dynamic> json) =>
      CouponInfoResponse(
        ok: json["ok"] ?? '',
        name: json["name"] ?? '',
        state: json["state"] ?? '',
        id: json["id"] ?? '',
        prizePoints: json["prize_points"] ?? 0,
        prizePointType: json["prize_point_type"],
        prizeName: json["prize_name"] ?? '',
        prizeDescription: json["prize_description"] ?? '',
        prizeImageUrl: json["prize_image_url"] ?? '',
        prizeTags: List<String>.from((json["prize_tags"] ?? []).map((x) => x)),
        expiresAt: json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "name": name,
        "state": state,
        "id": id,
        "prize_points": prizePoints,
        "prize_point_type": prizePointType,
        "prize_name": prizeName,
        "prize_description": prizeDescription,
        "prize_image_url": prizeImageUrl,
        "prize_tags": List<dynamic>.from(prizeTags.map((x) => x)),
        "expires_at": expiresAt,
      };
}
