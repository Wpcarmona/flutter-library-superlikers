class AcceptGoalsResponse {
  String ok;
  String message;

  AcceptGoalsResponse({
    required this.ok,
    required this.message,
  });

  factory AcceptGoalsResponse.fromJson(Map<String, dynamic> json) =>
      AcceptGoalsResponse(
        ok: json["ok"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
      };
}
