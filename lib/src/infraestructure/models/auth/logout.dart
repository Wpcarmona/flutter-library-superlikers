class LogoutResponse {
  String ok;
  String message;

  LogoutResponse({required this.ok, required this.message});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        ok: json["ok"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
