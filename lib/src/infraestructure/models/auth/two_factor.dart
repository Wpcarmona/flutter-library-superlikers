class SetupTwoFactorTotpResponse {
  String ok;
  String totpSecret;
  String totpauthUri;
  String qrBase64;

  SetupTwoFactorTotpResponse({
    required this.ok,
    required this.totpSecret,
    required this.totpauthUri,
    required this.qrBase64,
  });

  factory SetupTwoFactorTotpResponse.fromJson(Map<String, dynamic> json) =>
      SetupTwoFactorTotpResponse(
        ok: json["ok"]?.toString() ?? 'true',
        totpSecret: json["totp_secret"] ?? '',
        totpauthUri: json["totpauth_uri"] ?? '',
        qrBase64: json["qr_base64"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "totp_secret": totpSecret,
        "totpauth_uri": totpauthUri,
        "qr_base64": qrBase64,
      };
}
