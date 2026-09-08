class CalculateMetricsResponse {
  String ok;
  num result;

  CalculateMetricsResponse({
    required this.ok,
    required this.result,
  });

  factory CalculateMetricsResponse.fromJson(Map<String, dynamic> json) => CalculateMetricsResponse(
        ok: json["ok"],
        result: json["result"] as num,
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": result,
      };
}
