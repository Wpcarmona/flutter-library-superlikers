class ExternalFormActionResultResponse {
  String ok;
  String message;

  ExternalFormActionResultResponse({required this.ok, required this.message});

  factory ExternalFormActionResultResponse.fromJson(Map<String, dynamic> json) =>
      ExternalFormActionResultResponse(
        ok: json["ok"]?.toString() ?? 'true',
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
