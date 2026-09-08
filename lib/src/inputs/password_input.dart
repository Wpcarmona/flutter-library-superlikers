import 'package:formz/formz.dart';

enum PasswordError {
  empty,
  tooShort,
  missingUppercase,
  missingLowercase,
  missingNumber,
  missingSpecialChar,
}

/// Password validated against a configurable set of rules. Every rule is
/// opt-in via the constructor and defaults match the previous fixed
/// behaviour (min. 5 chars, at least one uppercase and one special char).
class Password extends FormzInput<String, PasswordError> {
  final int minLength;
  final bool requireUppercase;
  final bool requireLowercase;
  final bool requireNumber;
  final bool requireSpecialChar;

  static final RegExp _uppercase = RegExp(r'[A-Z]');
  static final RegExp _lowercase = RegExp(r'[a-z]');
  static final RegExp _number = RegExp(r'[0-9]');
  static final RegExp _specialChar = RegExp(r'[\W_]');

  Password.pure({
    this.minLength = 5,
    this.requireUppercase = true,
    this.requireLowercase = false,
    this.requireNumber = false,
    this.requireSpecialChar = true,
  }) : super.pure('');

  Password.dirty(
    String value, {
    this.minLength = 5,
    this.requireUppercase = true,
    this.requireLowercase = false,
    this.requireNumber = false,
    this.requireSpecialChar = true,
  }) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    switch (displayError!) {
      case PasswordError.empty:
        return 'El campo es obligatorio';
      case PasswordError.tooShort:
        return 'Debe tener al menos $minLength caracteres';
      case PasswordError.missingUppercase:
        return 'Debe contener al menos una mayúscula';
      case PasswordError.missingLowercase:
        return 'Debe contener al menos una minúscula';
      case PasswordError.missingNumber:
        return 'Debe contener al menos un número';
      case PasswordError.missingSpecialChar:
        return 'Debe contener al menos un carácter especial';
    }
  }

  @override
  PasswordError? validator(String value) {
    if (value.trim().isEmpty) return PasswordError.empty;
    if (value.length < minLength) return PasswordError.tooShort;
    if (requireUppercase && !_uppercase.hasMatch(value)) {
      return PasswordError.missingUppercase;
    }
    if (requireLowercase && !_lowercase.hasMatch(value)) {
      return PasswordError.missingLowercase;
    }
    if (requireNumber && !_number.hasMatch(value)) {
      return PasswordError.missingNumber;
    }
    if (requireSpecialChar && !_specialChar.hasMatch(value)) {
      return PasswordError.missingSpecialChar;
    }

    return null;
  }
}
