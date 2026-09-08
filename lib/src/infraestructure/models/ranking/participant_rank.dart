import 'dart:convert';

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
        ok: json["ok"],
        data: ParticipantRankingResponseData.fromJson(json["data"]),
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
  });

  factory ParticipantRankingResponseData.fromJson(Map<String, dynamic> json) =>
      ParticipantRankingResponseData(
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        votes: json["votes"],
        points: json["points"],
        level: json["level"],
        pointsByPtype: PointsByPtypeRanking.fromJson(json["points_by_ptype"]),
        data: DataData.fromJson(json["data"]),
        colour: json["colour"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        email: json["email"],
        celular: json["celular"],
        idEmpleado: json["id_empleado"],
        region: json["region"],
        tienda: json["tienda"],
        plaza: json["plaza"],
        nombreTienda: json["nombre_tienda"],
        terms: json["terms"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        rol: json["rol"],
        avatar: json["avatar"],
        cargo: json["cargo"],
        nivel: json["nivel"],
        ranking: json["ranking"],
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
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        email: json["email"],
        unconfirmedEmail: json["unconfirmed_email"],
        celular: json["celular"],
        idEmpleado: json["id_empleado"],
        region: json["region"],
        tienda: json["tienda"],
        plaza: json["plaza"],
        nombreTienda: json["nombre_tienda"],
        terms: json["terms"],
        tags: List<String>.from(json["tags"].map((x) => x)),
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

class PointsByPtypeRanking {
  PointsByPtypeRanking();

  factory PointsByPtypeRanking.fromJson(Map<String, dynamic> json) =>
      PointsByPtypeRanking();

  Map<String, dynamic> toJson() => {};
}
