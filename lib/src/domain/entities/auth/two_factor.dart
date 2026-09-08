/// Respuesta de `POST /participants/verify_two_factor_totp/setup`: arranca
/// la configuración de 2FA por TOTP (Google Authenticator y similares).
class SetupTwoFactorTotp {
  final String ok;
  final String totpSecret;
  final String totpauthUri;
  final String qrBase64;

  SetupTwoFactorTotp({
    required this.ok,
    required this.totpSecret,
    required this.totpauthUri,
    required this.qrBase64,
  });
}
