import 'dart:convert';

ParticipantPublicInfoResponse participantPublicInfoResponseFromJson(String str) =>
    ParticipantPublicInfoResponse.fromJson(json.decode(str));

String participantPublicInfoResponseToJson(ParticipantPublicInfoResponse data) =>
    json.encode(data.toJson());

class ParticipantPublicInfoResponse {
  String ok;
  Object object;

  ParticipantPublicInfoResponse({
    required this.ok,
    required this.object,
  });

  factory ParticipantPublicInfoResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantPublicInfoResponse(
        ok: json["ok"],
        object: Object.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "object": object.toJson(),
      };
}

/// Solo estos campos son consistentes entre campaigns (mismo nombre, mismo
/// significado); todo lo demás varía de forma y se guarda tal cual en
/// [properties]. Ver el comentario en la entidad de dominio para ver
/// ejemplos reales de cuánto varía el resto del payload.
class Object {
  String uid;
  dynamic uidType;
  String email;
  num points;
  num totalPoints;
  List<dynamic> coins;
  List<dynamic> totalCoins;
  String state;
  bool badEmail;
  bool emailVerified;
  bool cellphoneVerified;
  bool unconfirmedEmail;
  bool unconfirmedCellphone;
  String avatar;
  DateTime lastActivityAt;
  List<String> tags;
  Map<String, dynamic> properties;

  Object({
    required this.uid,
    required this.uidType,
    required this.email,
    required this.points,
    required this.totalPoints,
    required this.coins,
    required this.totalCoins,
    required this.state,
    required this.badEmail,
    required this.emailVerified,
    required this.cellphoneVerified,
    required this.unconfirmedEmail,
    required this.unconfirmedCellphone,
    required this.avatar,
    required this.lastActivityAt,
    required this.tags,
    this.properties = const {},
  });

  static const _knownKeys = {
    'uid',
    'uid_type',
    'email',
    'points',
    'total_points',
    'coins',
    'total_coins',
    'state',
    'bad_email',
    'email_verified',
    'cellphone_verified',
    'unconfirmed_email',
    'unconfirmed_cellphone',
    'avatar',
    'last_activity_at',
    'tags',
  };

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        uid: json["uid"] ?? '',
        uidType: json["uid_type"],
        email: json["email"] ?? '',
        points: json["points"] ?? 0,
        totalPoints: json["total_points"] ?? 0,
        coins: json["coins"] is List ? List<dynamic>.from(json["coins"]) : const [],
        totalCoins: json["total_coins"] is List
            ? List<dynamic>.from(json["total_coins"])
            : const [],
        state: json["state"] ?? '',
        badEmail: json["bad_email"] ?? false,
        emailVerified: json["email_verified"] ?? false,
        cellphoneVerified: json["cellphone_verified"] ?? false,
        unconfirmedEmail: json["unconfirmed_email"] ?? false,
        unconfirmedCellphone: json["unconfirmed_cellphone"] ?? false,
        avatar: json["avatar"] ?? '',
        lastActivityAt: json["last_activity_at"] != null
            ? DateTime.parse(json["last_activity_at"])
            : DateTime.fromMillisecondsSinceEpoch(0),
        tags: json["tags"] is List ? List<String>.from(json["tags"]) : const [],
        properties: Map<String, dynamic>.from(json)
          ..removeWhere((key, _) => _knownKeys.contains(key)),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uid_type": uidType,
        "email": email,
        "points": points,
        "total_points": totalPoints,
        "coins": coins,
        "total_coins": totalCoins,
        "state": state,
        "bad_email": badEmail,
        "email_verified": emailVerified,
        "cellphone_verified": cellphoneVerified,
        "unconfirmed_email": unconfirmedEmail,
        "unconfirmed_cellphone": unconfirmedCellphone,
        "avatar": avatar,
        "last_activity_at": lastActivityAt.toIso8601String(),
        "tags": tags,
        ...properties,
      };
}
