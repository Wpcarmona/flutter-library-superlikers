import 'dart:convert';

CreateActivityExternalResponse createActivityExternalResponseFromJson(String str) =>
    CreateActivityExternalResponse.fromJson(json.decode(str));

String createActivityExternalResponseToJson(CreateActivityExternalResponse data) =>
    json.encode(data.toJson());

class CreateActivityExternalResponse {
  String ok;
  int points;
  ParticipantPointsExternal participant;
  String message;

  CreateActivityExternalResponse({
    required this.ok,
    required this.points,
    required this.participant,
    required this.message,
  });

  factory CreateActivityExternalResponse.fromJson(Map<String, dynamic> json) =>
      CreateActivityExternalResponse(
        ok: json["ok"] ?? '',
        points: (json["points"] as num?)?.toInt() ?? 0,
        participant: json["participant"] != null
            ? ParticipantPointsExternal.fromJson(json["participant"])
            : ParticipantPointsExternal(
                accumulatedPoints: 0,
                availablePoints: 0,
                redeemedPoints: 0,
                pointsToExpire: 0,
                expirationDate: '',
                expiredPoints: 0,
              ),
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "points": points,
        "participant": participant.toJson(),
        "message": message,
      };
}

class ParticipantPointsExternal {
  int accumulatedPoints;
  int availablePoints;
  int redeemedPoints;
  int pointsToExpire;
  String expirationDate;
  int expiredPoints;

  ParticipantPointsExternal({
    required this.accumulatedPoints,
    required this.availablePoints,
    required this.redeemedPoints,
    required this.pointsToExpire,
    required this.expirationDate,
    required this.expiredPoints,
  });

  factory ParticipantPointsExternal.fromJson(Map<String, dynamic> json) => ParticipantPointsExternal(
        accumulatedPoints: (json["accumulated_points"] as num?)?.toInt() ?? 0,
        availablePoints: (json["available_points"] as num?)?.toInt() ?? 0,
        redeemedPoints: (json["redeemed_points"] as num?)?.toInt() ?? 0,
        pointsToExpire: (json["points_to_expire"] as num?)?.toInt() ?? 0,
        expirationDate: json["expiration_date"] ?? '',
        expiredPoints: (json["expired_points"] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "accumulated_points": accumulatedPoints,
        "available_points": availablePoints,
        "redeemed_points": redeemedPoints,
        "points_to_expire": pointsToExpire,
        "expiration_date": expirationDate,
        "expired_points": expiredPoints,
      };
}
