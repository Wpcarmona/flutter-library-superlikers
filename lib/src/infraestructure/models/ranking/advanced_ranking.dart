import 'dart:convert';

AdvancedRankingResponse advancedRankingResponseFromJson(String str) =>
    AdvancedRankingResponse.fromJson(json.decode(str));

String advancedRankingResponseToJson(AdvancedRankingResponse data) => json.encode(data.toJson());

class AdvancedRankingResponse {
  String ok;
  List<Datum> data;

  AdvancedRankingResponse({
    required this.ok,
    required this.data,
  });

  factory AdvancedRankingResponse.fromJson(Map<String, dynamic> json) =>
      AdvancedRankingResponse(
        ok: json["ok"]?.toString() ?? '',
        data: json["data"] is List
            ? [
                for (final x in json["data"] as List)
                  if (x is Map) Datum.fromJson(Map<String, dynamic>.from(x)),
              ]
            : <Datum>[],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String name;
  String firstName;
  String lastName;
  int votes;
  int points;
  int rankingPoints;
  int level;
  PointsByPtype pointsByPtype;
  DataAdvancedRanking data;
  dynamic colour;
  int ranking;

  /// `data` del participante tal cual vino del backend: su schema depende
  /// de la campaign, así que se conservan todos los campos (no solo los que
  /// [DataAdvancedRanking] tipa).
  Map<String, dynamic> rawData;

  /// `points_by_ptype` tal cual vino del backend (tipo de punto → puntos).
  Map<String, dynamic> rawPointsByPtype;

  Datum({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.votes,
    required this.points,
    required this.rankingPoints,
    required this.level,
    required this.pointsByPtype,
    required this.data,
    required this.colour,
    required this.ranking,
    this.rawData = const {},
    this.rawPointsByPtype = const {},
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    final data = _map(json["data"]);
    final pointsByPtype = _map(json["points_by_ptype"]);
    return Datum(
      name: json["name"]?.toString() ?? '',
      firstName: json["first_name"]?.toString() ?? '',
      lastName: json["last_name"]?.toString() ?? '',
      votes: rankingInt(json["votes"]),
      points: rankingInt(json["points"]),
      rankingPoints: rankingInt(json["ranking_points"]),
      level: rankingInt(json["level"]),
      pointsByPtype: PointsByPtype.fromJson(pointsByPtype),
      data: DataAdvancedRanking.fromJson(data),
      colour: json["colour"],
      ranking: rankingInt(json["ranking"]),
      rawData: data,
      rawPointsByPtype: pointsByPtype,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "votes": votes,
        "points": points,
        "ranking_points": rankingPoints,
        "level": level,
        "points_by_ptype": pointsByPtype.toJson(),
        "data": data.toJson(),
        "colour": colour,
        "ranking": ranking,
      };
}

class DataAdvancedRanking {
  String nombres;
  String apellidos;
  String email;
  String? unconfirmedEmail;
  String celular;
  String idEmpleado;
  String region;
  String tienda;
  String plaza;
  String? nombreTienda;
  bool terms;
  List<String> tags;
  dynamic rol;
  String? avatar;
  String? cargo;
  String? nivel;

  DataAdvancedRanking({
    required this.nombres,
    required this.apellidos,
    required this.email,
    this.unconfirmedEmail,
    required this.celular,
    required this.idEmpleado,
    required this.region,
    required this.tienda,
    required this.plaza,
    this.nombreTienda,
    required this.terms,
    required this.tags,
    required this.rol,
    this.avatar,
    this.cargo,
    this.nivel,
  });

  factory DataAdvancedRanking.fromJson(Map<String, dynamic> json) => DataAdvancedRanking(
        nombres: json["nombres"]?.toString() ?? '',
        apellidos: json["apellidos"]?.toString() ?? '',
        email: json["email"]?.toString() ?? '',
        unconfirmedEmail: json["unconfirmed_email"]?.toString(),
        celular: json["celular"]?.toString() ?? '',
        idEmpleado: json["id_empleado"]?.toString() ?? '',
        region: json["region"]?.toString() ?? '',
        tienda: json["tienda"]?.toString() ?? '',
        plaza: json["plaza"]?.toString() ?? '',
        nombreTienda: json["nombre_tienda"]?.toString(),
        terms: json["terms"] == true || json["terms"]?.toString() == 'true',
        tags: json["tags"] is List
            ? [for (final x in json["tags"] as List) if (x != null) x.toString()]
            : <String>[],
        rol: json["rol"],
        avatar: json["avatar"]?.toString(),
        cargo: json["cargo"]?.toString(),
        nivel: json["nivel"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidos": apellidos,
        "email": email,
        "unconfirmed_email": unconfirmedEmail,
        "celular": celular,
        "id_empleado": idEmpleado,
        "region": region,
        "tienda": tienda,
        "plaza": plaza,
        "nombre_tienda": nombreTienda,
        "terms": terms,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "rol": rol,
        "avatar": avatar,
        "cargo": cargo,
        "nivel": nivel,
      };
}

class PointsByPtype {
  PointsByPtype();

  factory PointsByPtype.fromJson(Map<String, dynamic> json) => PointsByPtype();

  Map<String, dynamic> toJson() => {};
}

Map<String, dynamic> _map(dynamic value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};

/// Entero tolerante para los campos numéricos del ranking (acepta decimales
/// y texto numérico; cualquier otra cosa es 0).
int rankingInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.round();
  if (value is String) {
    return int.tryParse(value.trim()) ?? double.tryParse(value.trim())?.round() ?? 0;
  }
  return 0;
}
