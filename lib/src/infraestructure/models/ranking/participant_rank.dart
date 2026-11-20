import 'dart:convert';

import 'advanced_ranking.dart' show rankingInt;

ParticipantRankingResponse participantRankingResponseFromJson(String str) =>
    ParticipantRankingResponse.fromJson(json.decode(str));

String participantRankingResponseToJson(ParticipantRankingResponse data) =>
    json.encode(data.toJson());

class ParticipantRankingResponse {
  String ok;
  ParticipantRankingResponseData data;

  ParticipantRankingResponse({
    required this.ok,
    required this.data,
  });

  factory ParticipantRankingResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantRankingResponse(
        ok: json["ok"]?.toString() ?? '',
        data: ParticipantRankingResponseData.fromJson(_rankMap(json["data"])),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
      };
}

class ParticipantRankingResponseData {
  String name;
  String firstName;
  String lastName;
  int votes;
  int points;
  int level;
  PointsByPtypeRanking pointsByPtype;
  DataData data;
  dynamic colour;
  String nombres;
  String apellidos;
  String email;
  String celular;
  String idEmpleado;
  String region;
  String tienda;
  String plaza;
  dynamic nombreTienda;
  bool terms;
  List<String> tags;
  dynamic rol;
  String avatar;
  dynamic cargo;
  dynamic nivel;
  int ranking;

  /// `data` del participante tal cual vino del backend (schema de la
  /// campaign).
  Map<String, dynamic> rawData;

  ParticipantRankingResponseData({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.votes,
    required this.points,
    required this.level,
    required this.pointsByPtype,
    required this.data,
    required this.colour,
    required this.nombres,
    required this.apellidos,
    required this.email,
    required this.celular,
    required this.idEmpleado,
    required this.region,
    required this.tienda,
    required this.plaza,
    required this.nombreTienda,
    required this.terms,
    required this.tags,
    required this.rol,
    required this.avatar,
    required this.cargo,
    required this.nivel,
    required this.ranking,
    this.rawData = const {},
  });

  factory ParticipantRankingResponseData.fromJson(Map<String, dynamic> json) =>
      ParticipantRankingResponseData(
        name: json["name"]?.toString() ?? '',
        firstName: json["first_name"]?.toString() ?? '',
        lastName: json["last_name"]?.toString() ?? '',
        votes: rankingInt(json["votes"]),
        points: rankingInt(json["points"]),
        level: rankingInt(json["level"]),
        pointsByPtype: PointsByPtypeRanking.fromJson(_rankMap(json["points_by_ptype"])),
        data: DataData.fromJson(_rankMap(json["data"])),
        colour: json["colour"],
        nombres: json["nombres"]?.toString() ?? '',
        apellidos: json["apellidos"]?.toString() ?? '',
        email: json["email"]?.toString() ?? '',
        celular: json["celular"]?.toString() ?? '',
        idEmpleado: json["id_empleado"]?.toString() ?? '',
        region: json["region"]?.toString() ?? '',
        tienda: json["tienda"]?.toString() ?? '',
        plaza: json["plaza"]?.toString() ?? '',
        nombreTienda: json["nombre_tienda"],
        terms: json["terms"] == true || json["terms"]?.toString() == 'true',
        tags: json["tags"] is List ? [for (final x in json["tags"] as List) if (x != null) x.toString()] : <String>[],
        rol: json["rol"],
        avatar: json["avatar"]?.toString() ?? '',
        cargo: json["cargo"],
        nivel: json["nivel"],
        ranking: rankingInt(json["ranking"]),
        rawData: _rankMap(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "votes": votes,
        "points": points,
        "level": level,
        "points_by_ptype": pointsByPtype.toJson(),
        "data": data.toJson(),
        "colour": colour,
        "nombres": nombres,
        "apellidos": apellidos,
        "email": email,
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
        "ranking": ranking,
      };
}

class DataData {
  String nombres;
  String apellidos;
  String email;
  String unconfirmedEmail;
  String celular;
  String idEmpleado;
  String region;
  String tienda;
  String plaza;
  dynamic nombreTienda;
  bool terms;
  List<String> tags;
  dynamic rol;
  String avatar;
  dynamic cargo;
  dynamic nivel;

  DataData({
    required this.nombres,
    required this.apellidos,
    required this.email,
    required this.unconfirmedEmail,
    required this.celular,
    required this.idEmpleado,
    required this.region,
    required this.tienda,
    required this.plaza,
    required this.nombreTienda,
    required this.terms,
    required this.tags,
    required this.rol,
    required this.avatar,
    required this.cargo,
    required this.nivel,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        nombres: json["nombres"]?.toString() ?? '',
        apellidos: json["apellidos"]?.toString() ?? '',
        email: json["email"]?.toString() ?? '',
        unconfirmedEmail: json["unconfirmed_email"]?.toString() ?? '',
        celular: json["celular"]?.toString() ?? '',
        idEmpleado: json["id_empleado"]?.toString() ?? '',
        region: json["region"]?.toString() ?? '',
        tienda: json["tienda"]?.toString() ?? '',
        plaza: json["plaza"]?.toString() ?? '',
        nombreTienda: json["nombre_tienda"],
        terms: json["terms"] == true || json["terms"]?.toString() == 'true',
        tags: json["tags"] is List ? [for (final x in json["tags"] as List) if (x != null) x.toString()] : <String>[],
        rol: json["rol"],
        avatar: json["avatar"]?.toString() ?? '',
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

class PointsByPtypeRanking {
  PointsByPtypeRanking();

  factory PointsByPtypeRanking.fromJson(Map<String, dynamic> json) =>
      PointsByPtypeRanking();

  Map<String, dynamic> toJson() => {};
}

Map<String, dynamic> _rankMap(dynamic value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};
