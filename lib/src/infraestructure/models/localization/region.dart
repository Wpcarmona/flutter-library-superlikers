class RegionResponse {
  String region;
  List<String> plazas;

  RegionResponse({
    required this.region,
    required this.plazas,
  });

  factory RegionResponse.fromJson(Map<String, dynamic> json) => RegionResponse(
        region: json["region"],
        plazas: List<String>.from(json["plazas"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "plazas": List<dynamic>.from(plazas.map((x) => x)),
      };
}
