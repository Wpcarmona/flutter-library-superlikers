import 'dart:convert';

ParticipantPublicInfoResponse participantPublicInfoResponseFromJson(String str) =>
    ParticipantPublicInfoResponse.fromJson(json.decode(str));

String participantPublicInfoResponseToJson(ParticipantPublicInfoResponse data) =>
    json.encode(data.toJson());

/// El backend a veces manda `celular` como string plano, y a veces como
/// objeto `{ccode, number}`. Esto normaliza ambos casos a un solo string.
String _celularFrom(dynamic raw) {
  if (raw == null) return '';
  if (raw is String) return raw;
  if (raw is Map) {
    final ccode = raw['ccode']?.toString() ?? '';
    final number = raw['number']?.toString() ?? '';
    if (ccode.isEmpty) return number;
    return '+$ccode $number';
  }
  return raw.toString();
}

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
  String nombres;
  String apellidos;
  String celular;
  String idEmpleado;
  String region;
  String tienda;
  String plaza;
  dynamic nombreTienda;
  bool terms;
  List<String> tags;
  dynamic rol;
  String cargo;
  String nivel;
  String fcm;
  String? autorizationNumber;
  String isPublisher;

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
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.idEmpleado,
    required this.region,
    required this.tienda,
    required this.plaza,
    required this.nombreTienda,
    required this.terms,
    required this.tags,
    required this.rol,
    required this.cargo,
    required this.nivel,
    required this.fcm,
    this.autorizationNumber,
    required this.isPublisher,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        uid: json["uid"],
        uidType: json["uid_type"],
        email: json["email"],
        points: json["points"],
        totalPoints: json["total_points"],
        coins: List<dynamic>.from(json["coins"].map((x) => x)),
        totalCoins: List<dynamic>.from(json["total_coins"].map((x) => x)),
        state: json["state"],
        badEmail: json["bad_email"],
        emailVerified: json["email_verified"],
        cellphoneVerified: json["cellphone_verified"],
        unconfirmedEmail: json["unconfirmed_email"],
        unconfirmedCellphone: json["unconfirmed_cellphone"],
        avatar: json["avatar"] ?? '',
        lastActivityAt: DateTime.parse(json["last_activity_at"]),
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        celular: _celularFrom(json["celular"]),
        idEmpleado: json["id_empleado"],
        region: json["region"],
        tienda: json["tienda"],
        plaza: json["plaza"],
        nombreTienda: json["nombre_tienda"] ?? '',
        terms: json["terms"] ?? false,
        tags: List<String>.from(json["tags"].map((x) => x)),
        rol: json["rol"] ?? '',
        cargo: json["cargo"] ?? '',
        nivel: json["nivel"] ?? '',
        fcm: json["fcm"] ?? '',
        autorizationNumber: json.containsKey("autorizacion_celular")
            ? (json["autorizacion_celular"]?.toString() ?? '')
            : null,
        isPublisher: json["ispublisher"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "uid_type": uidType,
        "email": email,
        "points": points,
        "total_points": totalPoints,
        "coins": List<dynamic>.from(coins.map((x) => x)),
        "total_coins": List<dynamic>.from(totalCoins.map((x) => x)),
        "state": state,
        "bad_email": badEmail,
        "email_verified": emailVerified,
        "cellphone_verified": cellphoneVerified,
        "unconfirmed_email": unconfirmedEmail,
        "unconfirmed_cellphone": unconfirmedCellphone,
        "avatar": avatar,
        "last_activity_at": lastActivityAt.toIso8601String(),
        "nombres": nombres,
        "apellidos": apellidos,
        "celular": celular,
        "id_empleado": idEmpleado,
        "region": region,
        "tienda": tienda,
        "plaza": plaza,
        "nombre_tienda": nombreTienda,
        "terms": terms,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "rol": rol,
        "cargo": cargo,
        "nivel": nivel,
        "fcm": fcm,
        "autorizacion_celular": autorizationNumber,
        "ispublisher": isPublisher
      };
}
