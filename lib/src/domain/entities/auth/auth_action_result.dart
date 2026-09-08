/// Resultado ok/message compartido por varios endpoints simples de auth
/// (verificar teléfono, 2FA, cambio de contraseña autenticado) cuyo único
/// dato de respuesta es un mensaje de éxito/error.
class AuthActionResult {
  final String ok;
  final String message;

  AuthActionResult({required this.ok, required this.message});
}
