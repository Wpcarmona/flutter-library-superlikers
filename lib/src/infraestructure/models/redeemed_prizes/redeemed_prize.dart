class RedeemedPrizesResponse {
  bool ok;
  String category;
  int total;
  List<RedeemedPrizeData> data;

  RedeemedPrizesResponse({
    required this.ok,
    required this.category,
    required this.total,
    required this.data,
  });

  factory RedeemedPrizesResponse.fromJson(Map<String, dynamic> json) =>
      RedeemedPrizesResponse(
        ok: json["ok"] == true,
        category: json["category"]?.toString() ?? '',
        total: json["total"] ?? 0,
        data: (json["data"] is List)
            ? List<RedeemedPrizeData>.from(
                (json["data"] as List).map(
                  (x) => RedeemedPrizeData.fromJson(
                    x is Map ? Map<String, dynamic>.from(x) : {},
                  ),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "category": category,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RedeemedPrizeData {
  String prizeId;
  String prizeName;
  String description;
  List<String> tags;
  int coins;
  DateTime? redeemedAt;
  String redemptionState;
  String redemptionCode;
  RedeemedPrizeUserResponse user;
  bool matchedInCatalog;

  RedeemedPrizeData({
    required this.prizeId,
    required this.prizeName,
    required this.description,
    required this.tags,
    required this.coins,
    required this.redeemedAt,
    required this.redemptionState,
    required this.redemptionCode,
    required this.user,
    required this.matchedInCatalog,
  });

  factory RedeemedPrizeData.fromJson(Map<String, dynamic> json) =>
      RedeemedPrizeData(
        prizeId: json["prize_id"]?.toString() ?? '',
        prizeName: json["prize_name"]?.toString() ?? '',
        description: json["description"]?.toString() ?? '',
        tags: List<String>.from(
          (json["tags"] ?? []).map((x) => x.toString()),
        ),
        coins: json["coins"] ?? 0,
        redeemedAt: json["redeemed_at"] != null
            ? DateTime.tryParse(json["redeemed_at"].toString())
            : null,
        redemptionState: json["redemption_state"]?.toString() ?? '',
        redemptionCode: json["redemption_code"]?.toString() ?? '',
        user: RedeemedPrizeUserResponse.fromJson(
          json["user"] is Map
              ? Map<String, dynamic>.from(json["user"] as Map)
              : {},
        ),
        matchedInCatalog: json["matched_in_catalog"] == true,
      );

  Map<String, dynamic> toJson() => {
        "prize_id": prizeId,
        "prize_name": prizeName,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "coins": coins,
        "redeemed_at": redeemedAt?.toIso8601String(),
        "redemption_state": redemptionState,
        "redemption_code": redemptionCode,
        "user": user.toJson(),
        "matched_in_catalog": matchedInCatalog,
      };
}

class RedeemedPrizeUserResponse {
  String name;
  String uid;
  String email;

  RedeemedPrizeUserResponse({
    required this.name,
    required this.uid,
    required this.email,
  });

  factory RedeemedPrizeUserResponse.fromJson(Map<String, dynamic> json) =>
      RedeemedPrizeUserResponse(
        name: json["name"]?.toString() ?? '',
        uid: json["uid"]?.toString() ?? '',
        email: json["email"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"name": name, "uid": uid, "email": email};
}
