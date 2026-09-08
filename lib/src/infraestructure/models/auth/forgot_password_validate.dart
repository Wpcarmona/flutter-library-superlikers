class ValidateChannelResponse {
  String ok;
  String message;

  ValidateChannelResponse({required this.ok, required this.message});

  factory ValidateChannelResponse.fromJson(Map<String, dynamic> json) =>
      ValidateChannelResponse(ok: json["ok"], message: json["message"]);

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
