import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;
import '../participant/participant_mapper.dart';

class AuthMapper {
  static domain.Login loginToEntity(infra.LoginResponse login) => domain.Login(
        ok: login.ok,
        token: login.token,
        participant: ParticipantMapper.toEntity(login.participant),
        message: login.message,
      );

  static domain.Logout logoutToEntity(infra.LogoutResponse logout) =>
      domain.Logout(ok: logout.ok, message: logout.message);

  static domain.Register registerToEntity(infra.RegisterResponse register) =>
      domain.Register(
        ok: register.ok,
        token: register.token,
        participant: ParticipantMapper.toEntity(register.participantData),
        message: register.message,
      );

  static domain.ForgotPassword resetPassWordValidateToEntity(
    infra.ValidateChannelResponse resetPassWordValidate,
  ) =>
      domain.ForgotPassword(
        ok: resetPassWordValidate.ok,
        message: resetPassWordValidate.message,
      );

  static domain.ForgotPassword resetPasswordToEntity(
    infra.ResetPasswordResponse resetPassword,
  ) =>
      domain.ForgotPassword(ok: resetPassword.ok, message: resetPassword.message);

  static domain.EmailVerify verifyEmailToEntity(
    infra.VerifyEmailResponse verifyEmail,
  ) =>
      domain.EmailVerify(ok: verifyEmail.ok, message: verifyEmail.message);

  static domain.EmailVerify verifyEmailResendToEntity(
    infra.VerifyEmailResponse verifyEmailResend,
  ) =>
      domain.EmailVerify(
        ok: verifyEmailResend.ok,
        message: verifyEmailResend.message,
      );

  static domain.AuthActionResult authActionResultToEntity(
    infra.AuthActionResultResponse response,
  ) =>
      domain.AuthActionResult(ok: response.ok, message: response.message);

  static domain.SetupTwoFactorTotp setupTwoFactorTotpToEntity(
    infra.SetupTwoFactorTotpResponse response,
  ) =>
      domain.SetupTwoFactorTotp(
        ok: response.ok,
        totpSecret: response.totpSecret,
        totpauthUri: response.totpauthUri,
        qrBase64: response.qrBase64,
      );

  static domain.LoginForm loginFormToEntity(infra.LoginFormResponse response) =>
      domain.LoginForm(
        ok: response.ok,
        fields: response.fields
            .map(
              (f) => domain.LoginFormField(
                type: f.type,
                fieldType: f.fieldType,
                name: f.name,
                label: f.label,
                requiredField: f.requiredField,
                uniqueField: f.uniqueField,
                properties: f.properties,
              ),
            )
            .toList(),
      );

  static domain.ParticipantLoginRequirements participantLoginRequirementsToEntity(
    infra.ParticipantLoginRequirementsResponse response,
  ) =>
      domain.ParticipantLoginRequirements(
        ok: response.ok,
        allowed: response.allowed,
        redirectPage: response.redirectPage,
        message: response.message,
      );
}
