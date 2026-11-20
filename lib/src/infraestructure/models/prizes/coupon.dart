import '../utils/json_read.dart';
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
        ok: readString(json["ok"], ''),
        object: CouponRedeemObject.fromJson(readMap(json["object"])),
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
        coupon: ObjectReward.fromJson(readMap(json["coupon"])),
        redemption: CouponRedemption.fromJson(readMap(json["redemption"])),
        message: readString(json["message"], ''),
      );

  Map<String, dynamic> toJson() => {
        "coupon": coupon.toJson(),
        "redemption": redemption.toJson(),
        "message": message,
      };
}

class CouponRedemption {
  Map<String, dynamic> raw;

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
    this.raw = const {},
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
        raw: json,
        id: readString(json["_id"], ''),
        redeemId: readString(json["redeem_id"], ''),
        prizeName: readString(json["prize_name"], ''),
        imageUrl: readString(json["image_url"], ''),
        createdAt: readInt(json["created_at"], 0),
        updatedAt: readInt(json["updated_at"], 0),
        points: readInt(json["points"], 0),
        pointType: json["point_type"],
        state: readString(json["state"], ''),
        isRedemptionCoupon: readBool(json["is_redemption_coupon"], false),
        prizeDescription: readString(json["prize_description"], ''),
        code: readString(json["code"], ''),
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
        ok: readString(json["ok"], ''),
        name: readString(json["name"], ''),
        state: readString(json["state"], ''),
        id: readString(json["id"], ''),
        prizePoints: readNum(json["prize_points"], 0),
        prizePointType: json["prize_point_type"],
        prizeName: readString(json["prize_name"], ''),
        prizeDescription: readString(json["prize_description"], ''),
        prizeImageUrl: readString(json["prize_image_url"], ''),
        prizeTags: readStringList(json["prize_tags"]),
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
