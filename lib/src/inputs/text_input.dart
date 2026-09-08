import 'package:formz/formz.dart';

enum RequiredTextError { empty, tooShort, tooLong }

/// Generic non-empty text input with optional length bounds.
class RequiredText extends FormzInput<String, RequiredTextError> {
  final int minLength;
  final int? maxLength;

  const RequiredText.pure({this.minLength = 1, this.maxLength}) : super.pure('');

  const RequiredText.dirty(super.value, {this.minLength = 1, this.maxLength})
      : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == RequiredTextError.empty) return 'El campo es obligatorio';
    if (displayError == RequiredTextError.tooShort) {
      return 'Debe tener al menos $minLength caracteres';
    }
    if (displayError == RequiredTextError.tooLong) {
      return 'Debe tener máximo $maxLength caracteres';
    }

    return null;
  }

  @override
  RequiredTextError? validator(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return RequiredTextError.empty;
    if (trimmed.length < minLength) return RequiredTextError.tooShort;
    if (maxLength != null && trimmed.length > maxLength!) {
      return RequiredTextError.tooLong;
    }

    return null;
  }
}
