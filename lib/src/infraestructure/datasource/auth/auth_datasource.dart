import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  Login _jsonToLogin(Map<String, dynamic> json) {
    final loginResponse = LoginResponse.fromJson(json);
    return AuthMapper.loginToEntity(loginResponse);
  }

  Logout _jsonToLogout(Map<String, dynamic> json) {
    final logoutResponse = LogoutResponse.fromJson(json);
    return AuthMapper.logoutToEntity(logoutResponse);
  }

  Register _jsonToRegister(Map<String, dynamic> json) {
    final registerResponse = RegisterResponse.fromJson(json);
    return AuthMapper.registerToEntity(registerResponse);
  }

  ForgotPassword _jsonToResetPassWordValidate(Map<String, dynamic> json) {
    final resetPassWordValidateResponse = ValidateChannelResponse.fromJson(json);
    return AuthMapper.resetPassWordValidateToEntity(resetPassWordValidateResponse);
  }

  ForgotPassword _jsonToResetPassword(Map<String, dynamic> json) {
    final resetPasswordResponse = ResetPasswordResponse.fromJson(json);
    return AuthMapper.resetPasswordToEntity(resetPasswordResponse);
  }

  EmailVerify _jsonToEmailVerify(Map<String, dynamic> json) {
    final verifyEmailResponse = VerifyEmailResponse.fromJson(json);
    return AuthMapper.verifyEmailToEntity(verifyEmailResponse);
  }

  EmailVerify _jsonToEmailVerifyResend(Map<String, dynamic> json) {
    final verifyEmailResendResponse = VerifyEmailResponse.fromJson(json);
    return AuthMapper.verifyEmailResendToEntity(verifyEmailResendResponse);
  }

  AuthActionResult _jsonToAuthActionResult(Map<String, dynamic> json) {
    final response = AuthActionResultResponse.fromJson(json);
    return AuthMapper.authActionResultToEntity(response);
  }

  Map<String, dynamic> _parseResponse(dynamic raw) =>
      raw is String ? jsonDecode(raw) : Map<String, dynamic>.from(raw as Map);

  @override
  Future<Login> login({required Map<String, dynamic> participation}) async {
    final response = await dio.post(
      '/microsite/sessions/login',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "participation": participation,
      },
    );
    final Map<String, dynamic> data = jsonDecode(response.data);
    return _jsonToLogin(data);
  }

  @override
  Future<Logout> logout({required String token}) async {
    final response = await dio.post(
      '/microsite/sessions/logout',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final Map<String, dynamic> data = jsonDecode(response.data);
    return _jsonToLogout(data);
  }

  @override
  Future<Register> register({required Map<String, dynamic> properties}) async {
    final response = await dio.post(
      '/microsite/participants',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "properties": properties,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRegister(responseData);
  }

  @override
  Future<ForgotPassword> forgotPassword({required String email}) async {
    final response = await dio.post(
      '/microsite/passwords',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "participation": {"email": email},
        "notification_channel": "email",
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToResetPassword(responseData);
  }

  @override
  Future<ForgotPassword> forgotPasswordValidate({required String email}) async {
    final response = await dio.post(
      '/microsite/passwords/validate_channel',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "email": email,
      },
    );

    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToResetPassWordValidate(responseData);
  }

  @override
  Future<ForgotPassword> updatePasswordToken({
    required String token,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    final response = await dio.post(
      '/passwords/update',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "participation": {
          "password": newPassword,
          "password_confirmation": newPasswordConfirmation,
        },
        "token": token,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToResetPassword(responseData);
  }

  @override
  Future<EmailVerify> verifyEmail({required String uid}) async {
    final response = await dio.post(
      '/participants/send_verify_email',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "distinct_id": uid,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToEmailVerify(responseData);
  }

  @override
  Future<EmailVerify> verifyEmailResend({
    required String uid,
    required String code,
  }) async {
    final response = await dio.post(
      '/participants/verify_email',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "distinct_id": uid,
        "code": code,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToEmailVerifyResend(responseData);
  }

  @override
  Future<LoginForm> getLoginForm() async {
    final response = await dio.post(
      '/microsite/sessions/loginform',
      data: {"campaign": Environment.campaign},
    );
    final responseData = _parseResponse(response.data);
    return AuthMapper.loginFormToEntity(LoginFormResponse.fromJson(responseData));
  }

  @override
  Future<ParticipantLoginRequirements> getParticipantLoginRequirements({
    required String token,
  }) async {
    final response = await dio.post(
      '/microsite/sessions/participant_login_requirements',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
      },
    );
    final responseData = _parseResponse(response.data);
    return AuthMapper.participantLoginRequirementsToEntity(
      ParticipantLoginRequirementsResponse.fromJson(responseData),
    );
  }

  @override
  Future<AuthActionResult> sendVerifyPhone({required String token}) async {
    final response = await dio.post(
      '/microsite/participants/send_verify_phone',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
      },
    );
    return _jsonToAuthActionResult(_parseResponse(response.data));
  }

  @override
  Future<AuthActionResult> verifyPhone({
    required String token,
    required String code,
  }) async {
    final response = await dio.post(
      '/microsite/participants/verify_phone',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "code": code,
      },
    );
    return _jsonToAuthActionResult(_parseResponse(response.data));
  }

  @override
  Future<AuthActionResult> sendVerifyTwoFactor({
    required String token,
    required String channel,
  }) async {
    final response = await dio.post(
      '/microsite/participants/send_verify_two_factor',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "channel": channel,
      },
    );
    return _jsonToAuthActionResult(_parseResponse(response.data));
  }

  @override
  Future<AuthActionResult> verifyTwoFactor({
    required String token,
    required String channel,
    required String code,
  }) async {
    final response = await dio.post(
      '/microsite/participants/verify_two_factor',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "channel": channel,
        "code": code,
      },
    );
    return _jsonToAuthActionResult(_parseResponse(response.data));
  }

  @override
  Future<SetupTwoFactorTotp> setupTwoFactorTotp({required String token}) async {
    final response = await dio.post(
      '/microsite/participants/verify_two_factor_totp/setup',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
      },
    );
    final responseData = _parseResponse(response.data);
    return AuthMapper.setupTwoFactorTotpToEntity(
      SetupTwoFactorTotpResponse.fromJson(responseData),
    );
  }

  @override
  Future<AuthActionResult> confirmTwoFactorTotp({
    required String token,
    required String code1,
    required String code2,
  }) async {
    final response = await dio.post(
      '/microsite/participants/verify_two_factor_totp/confirm',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "code_1": code1,
        "code_2": code2,
      },
    );
    return _jsonToAuthActionResult(_parseResponse(response.data));
  }

  @override
  Future<AuthActionResult> verifyTwoFactorTotp({
    required String token,
    required String code,
  }) async {
    final response = await dio.post(
      '/microsite/participants/verify_two_factor_totp',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "code": code,
      },
    );
    return _jsonToAuthActionResult(_parseResponse(response.data));
  }

  @override
  Future<ForgotPassword> changePassword({
    required String token,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await dio.post(
      '/microsite/passwords/change',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "participation": {
          "current_password": currentPassword,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      },
    );
    final responseData = _parseResponse(response.data);
    return AuthMapper.resetPasswordToEntity(ResetPasswordResponse.fromJson(responseData));
  }
}
