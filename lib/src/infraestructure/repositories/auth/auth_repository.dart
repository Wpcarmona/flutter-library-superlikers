import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl([AuthDatasource? datasource])
      : authDatasource = datasource ?? AuthDatasourceImpl();

  @override
  Future<Login> login({required Map<String, dynamic> participation}) {
    return authDatasource.login(participation: participation);
  }

  @override
  Future<Logout> logout({required String token}) {
    return authDatasource.logout(token: token);
  }

  @override
  Future<Register> register({required Map<String, dynamic> properties}) {
    return authDatasource.register(properties: properties);
  }

  @override
  Future<ForgotPassword> forgotPassword({required String email}) {
    return authDatasource.forgotPassword(email: email);
  }

  @override
  Future<ForgotPassword> forgotPasswordValidate({required String email}) {
    return authDatasource.forgotPasswordValidate(email: email);
  }

  @override
  Future<ForgotPassword> updatePasswordToken({
    required String token,
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    return authDatasource.updatePasswordToken(
      token: token,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );
  }

  @override
  Future<EmailVerify> verifyEmail({required String uid}) {
    return authDatasource.verifyEmail(uid: uid);
  }

  @override
  Future<EmailVerify> verifyEmailResend({
    required String uid,
    required String code,
  }) {
    return authDatasource.verifyEmailResend(uid: uid, code: code);
  }

  @override
  Future<LoginForm> getLoginForm() {
    return authDatasource.getLoginForm();
  }

  @override
  Future<ParticipantLoginRequirements> getParticipantLoginRequirements({
    required String token,
  }) {
    return authDatasource.getParticipantLoginRequirements(token: token);
  }

  @override
  Future<AuthActionResult> sendVerifyPhone({required String token}) {
    return authDatasource.sendVerifyPhone(token: token);
  }

  @override
  Future<AuthActionResult> verifyPhone({
    required String token,
    required String code,
  }) {
    return authDatasource.verifyPhone(token: token, code: code);
  }

  @override
  Future<AuthActionResult> sendVerifyTwoFactor({
    required String token,
    required String channel,
  }) {
    return authDatasource.sendVerifyTwoFactor(token: token, channel: channel);
  }

  @override
  Future<AuthActionResult> verifyTwoFactor({
    required String token,
    required String channel,
    required String code,
  }) {
    return authDatasource.verifyTwoFactor(token: token, channel: channel, code: code);
  }

  @override
  Future<SetupTwoFactorTotp> setupTwoFactorTotp({required String token}) {
    return authDatasource.setupTwoFactorTotp(token: token);
  }

  @override
  Future<AuthActionResult> confirmTwoFactorTotp({
    required String token,
    required String code1,
    required String code2,
  }) {
    return authDatasource.confirmTwoFactorTotp(token: token, code1: code1, code2: code2);
  }

  @override
  Future<AuthActionResult> verifyTwoFactorTotp({
    required String token,
    required String code,
  }) {
    return authDatasource.verifyTwoFactorTotp(token: token, code: code);
  }

  @override
  Future<ForgotPassword> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) {
    return authDatasource.changePassword(
      token: token,
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
