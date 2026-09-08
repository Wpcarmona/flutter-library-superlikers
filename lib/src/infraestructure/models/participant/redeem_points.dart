class RedeemPointsResponse {
  String ok;
  String message;

  RedeemPointsResponse({required this.ok, required this.message});

  factory RedeemPointsResponse.fromJson(Map<String, dynamic> json) => RedeemPointsResponse(
        ok: json["ok"]?.toString() ?? 'true',
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
