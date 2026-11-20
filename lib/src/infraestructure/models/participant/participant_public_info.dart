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
        ok: json["ok"]?.toString() ?? '',
        object: Object.fromJson(
          json["object"] is Map
              ? Map<String, dynamic>.from(json["object"])
              : const <String, dynamic>{},
        ),
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
        uid: json["uid"]?.toString() ?? '',
        uidType: json["uid_type"],
        email: json["email"]?.toString() ?? '',
        points: _num(json["points"]),
        totalPoints: _num(json["total_points"]),
        coins: json["coins"] is List ? List<dynamic>.from(json["coins"]) : const [],
        totalCoins: json["total_coins"] is List
            ? List<dynamic>.from(json["total_coins"])
            : const [],
        state: json["state"]?.toString() ?? '',
        badEmail: _bool(json["bad_email"]),
        emailVerified: _bool(json["email_verified"]),
        cellphoneVerified: _bool(json["cellphone_verified"]),
        unconfirmedEmail: _bool(json["unconfirmed_email"]),
        unconfirmedCellphone: _bool(json["unconfirmed_cellphone"]),
        avatar: json["avatar"]?.toString() ?? '',
        lastActivityAt: DateTime.tryParse('${json["last_activity_at"]}') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        tags: json["tags"] is List
            ? [
                for (final tag in json["tags"] as List)
                  if (tag != null) tag.toString(),
              ]
            : const [],
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

/// Número tolerante: acepta enteros, decimales o texto numérico.
num _num(dynamic value) {
  if (value is num) return value;
  if (value is String) return num.tryParse(value.trim()) ?? 0;
  return 0;
}

/// Booleano tolerante: acepta `true`/`false`, `"true"`/`"false"` y 1/0.
bool _bool(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) return value.trim().toLowerCase() == 'true';
  return false;
}
