import 'package:formz/formz.dart';

enum UsernameError { empty, tooShort, tooLong }

class Username extends FormzInput<String, UsernameError> {
  final int minLength;
  final int? maxLength;

  const Username.pure({this.minLength = 6, this.maxLength}) : super.pure('');

  const Username.dirty(super.value, {this.minLength = 6, this.maxLength})
      : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsernameError.empty) return 'El campo es obligatorio';
    if (displayError == UsernameError.tooShort) {
      return 'El campo debe tener al menos $minLength caracteres';
    }
    if (displayError == UsernameError.tooLong) {
      return 'El campo debe tener máximo $maxLength caracteres';
    }

    return null;
  }

  @override
  UsernameError? validator(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return UsernameError.empty;
    if (trimmed.length < minLength) return UsernameError.tooShort;
    if (maxLength != null && trimmed.length > maxLength!) {
      return UsernameError.tooLong;
    }

    return null;
  }
}
