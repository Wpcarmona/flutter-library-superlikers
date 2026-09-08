class VerifyEmailResponse {
  String ok;
  String message;

  VerifyEmailResponse({required this.ok, required this.message});

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponse(ok: json["ok"], message: json["message"]);

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
