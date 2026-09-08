import 'package:formz/formz.dart';

enum OtpCodeError { empty, invalidLength }

/// OTP code input. Defaults to 6 digits, matching the most common SMS/email
/// verification code length; pass [length] to support other lengths.
class OtpCode extends FormzInput<String, OtpCodeError> {
  final int length;

  const OtpCode.pure({this.length = 6}) : super.pure('');

  const OtpCode.dirty(super.value, {this.length = 6}) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == OtpCodeError.empty) return 'El campo es obligatorio';
    if (displayError == OtpCodeError.invalidLength) {
      return 'Debes ingresar los $length dígitos';
    }

    return null;
  }

  @override
  OtpCodeError? validator(String value) {
    if (value.trim().isEmpty) return OtpCodeError.empty;
    if (value.length != length) return OtpCodeError.invalidLength;

    return null;
  }
}
