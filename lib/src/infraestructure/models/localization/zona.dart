class ZonaResponse {
  String? zona;
  List<String> regiones;

  ZonaResponse({
    required this.zona,
    required this.regiones,
  });

  factory ZonaResponse.fromJson(Map<String, dynamic> json) => ZonaResponse(
        zona: json["zona"],
        regiones: List<String>.from(json["regiones"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "zona": zona,
        "regiones": List<dynamic>.from(regiones.map((x) => x)),
      };
}
