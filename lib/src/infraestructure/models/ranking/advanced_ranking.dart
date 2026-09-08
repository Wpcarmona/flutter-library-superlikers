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
        ok: json["ok"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        votes: json["votes"],
        points: json["points"],
        rankingPoints: json["ranking_points"],
        level: json["level"],
        pointsByPtype: PointsByPtype.fromJson(json["points_by_ptype"]),
        data: DataAdvancedRanking.fromJson(json["data"]),
        colour: json["colour"],
        ranking: json["ranking"],
      );

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
        nombres: json["nombres"] ?? '',
        apellidos: json["apellidos"] ?? '',
        email: json["email"] ?? '',
        unconfirmedEmail: json["unconfirmed_email"],
        celular: json["celular"] ?? '',
        idEmpleado: json["id_empleado"] ?? '',
        region: json["region"] ?? '',
        tienda: json["tienda"] ?? '',
        plaza: json["plaza"] ?? '',
        nombreTienda: json["nombre_tienda"],
        terms: json["terms"] ?? false,
        tags: json["tags"] != null ? List<String>.from(json["tags"].map((x) => x)) : [],
        rol: json["rol"],
        avatar: json["avatar"],
        cargo: json["cargo"],
        nivel: json["nivel"],
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
