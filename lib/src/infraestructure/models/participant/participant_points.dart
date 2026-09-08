class ParticipantPointsResponse {
  String ok;
  ParticipantPointsObject object;

  ParticipantPointsResponse({required this.ok, required this.object});

  factory ParticipantPointsResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantPointsResponse(
        ok: json["ok"]?.toString() ?? 'true',
        object: ParticipantPointsObject.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "object": object.toJson()};
}

class ParticipantPointsObject {
  num totalPoints;
  num points;
  num redeemedPoints;
  num pointsToExpire;
  String expirationDate;
  num expiredPoints;

  ParticipantPointsObject({
    required this.totalPoints,
    required this.points,
    required this.redeemedPoints,
    required this.pointsToExpire,
    required this.expirationDate,
    required this.expiredPoints,
  });

  factory ParticipantPointsObject.fromJson(Map<String, dynamic> json) => ParticipantPointsObject(
        totalPoints: json["total_points"] ?? 0,
        points: json["points"] ?? 0,
        redeemedPoints: json["redeemed_points"] ?? 0,
        pointsToExpire: json["points_to_expire"] ?? 0,
        expirationDate: json["expiration_date"]?.toString() ?? '',
        expiredPoints: json["expired_points"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "total_points": totalPoints,
        "points": points,
        "redeemed_points": redeemedPoints,
        "points_to_expire": pointsToExpire,
        "expiration_date": expirationDate,
        "expired_points": expiredPoints,
      };
}
