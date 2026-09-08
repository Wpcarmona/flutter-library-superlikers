import 'package:formz/formz.dart';

enum IdUserError { empty, format, tooLong }

/// Numeric ID input (e.g. employee/participant id). Defaults to a maximum
/// of 7 digits; pass [maxLength] to match a different ID scheme.
class IdUser extends FormzInput<String, IdUserError> {
  final int maxLength;

  static final RegExp _digitsOnly = RegExp(r'^\d+$');

  const IdUser.pure({this.maxLength = 7}) : super.pure('');

  const IdUser.dirty(super.value, {this.maxLength = 7}) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == IdUserError.empty) return 'El campo es obligatorio';
    if (displayError == IdUserError.format) return 'Solo se permiten números';
    if (displayError == IdUserError.tooLong) {
      return 'Máximo $maxLength dígitos';
    }
    return null;
  }

  @override
  IdUserError? validator(String value) {
    if (value.trim().isEmpty) return IdUserError.empty;
    if (!_digitsOnly.hasMatch(value)) return IdUserError.format;
    if (value.length > maxLength) return IdUserError.tooLong;
    return null;
  }
}
