class UnnacceptGoalsResponse {
  String ok;
  String message;

  UnnacceptGoalsResponse({
    required this.ok,
    required this.message,
  });

  factory UnnacceptGoalsResponse.fromJson(Map<String, dynamic> json) =>
      UnnacceptGoalsResponse(
        ok: json["ok"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
      };
}
