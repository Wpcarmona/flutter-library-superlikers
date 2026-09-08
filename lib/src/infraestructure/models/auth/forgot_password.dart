class ResetPasswordResponse {
  final String ok;
  final String message;

  ResetPasswordResponse({required this.ok, required this.message});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(ok: json["ok"], message: json["message"]);

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
