class AuthActionResultResponse {
  String ok;
  String message;

  AuthActionResultResponse({required this.ok, required this.message});

  factory AuthActionResultResponse.fromJson(Map<String, dynamic> json) =>
      AuthActionResultResponse(
        ok: json["ok"]?.toString() ?? 'true',
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
