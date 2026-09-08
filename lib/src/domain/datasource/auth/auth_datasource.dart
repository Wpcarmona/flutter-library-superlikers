import '../../entities/entities.dart';

abstract class AuthDatasource {
  /// [participation] son los campos que la campaign pida para identificar
  /// al participante + su password (ej. `{'id_empleado': ..., 'password':
  /// ...}` en OXXO, `{'email': ..., 'password': ...}` en otro cliente,
  /// `{'cedula': ..., 'password': ...}` en otro): cada app arma el mapa
  /// según su propio formulario de login.
  Future<Login> login({required Map<String, dynamic> participation});

  Future<Logout> logout({required String token});

  /// [properties] son los campos del formulario de registro de la
  /// campaign (varían por cliente: OXXO pide `plaza`/`region`/`tienda`,
  /// otro cliente puede pedir otro set distinto). Se envían tal cual al
  /// backend.
  Future<Register> register({required Map<String, dynamic> properties});

  Future<ForgotPassword> forgotPassword({required String email});

  Future<ForgotPassword> forgotPasswordValidate({required String email});

  Future<ForgotPassword> updatePasswordToken({
    required String token,
    required String newPassword,
    required String newPasswordConfirmation,
  });

  Future<EmailVerify> verifyEmail({required String uid});

  Future<EmailVerify> verifyEmailResend({
    required String uid,
    required String code,
  });

  /// Campos dinámicos del formulario de login de la campaign (previo a
  /// autenticarse, no requiere token).
  Future<LoginForm> getLoginForm();

  /// Si el participante autenticado cumple los requisitos de login
  /// configurados en la campaign (ej. verificación de email obligatoria).
  Future<ParticipantLoginRequirements> getParticipantLoginRequirements({
    required String token,
  });

  Future<AuthActionResult> sendVerifyPhone({required String token});

  Future<AuthActionResult> verifyPhone({
    required String token,
    required String code,
  });

  /// [channel] es el canal por el que se envía el código: `email` o `sms`.
  Future<AuthActionResult> sendVerifyTwoFactor({
    required String token,
    required String channel,
  });

  Future<AuthActionResult> verifyTwoFactor({
    required String token,
    required String channel,
    required String code,
  });

  /// Arranca la configuración de 2FA por TOTP (Google Authenticator y
  /// similares): devuelve el secreto y el QR para escanear.
  Future<SetupTwoFactorTotp> setupTwoFactorTotp({required String token});

  /// Confirma la configuración de TOTP con dos códigos consecutivos
  /// generados por la app autenticadora (para validar que el reloj del
  /// dispositivo está sincronizado).
  Future<AuthActionResult> confirmTwoFactorTotp({
    required String token,
    required String code1,
    required String code2,
  });

  Future<AuthActionResult> verifyTwoFactorTotp({
    required String token,
    required String code,
  });

  /// Cambio de contraseña autenticado (distinto del flujo de "olvidé mi
  /// contraseña", que no requiere sesión).
  Future<ForgotPassword> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  });
}
