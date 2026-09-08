import 'package:formz/formz.dart';

enum PhoneNumberError { empty, tooShort, tooLong }

class PhoneNumber extends FormzInput<String, PhoneNumberError> {
  final int minLength;
  final int? maxLength;

  const PhoneNumber.pure({this.minLength = 6, this.maxLength}) : super.pure('');

  const PhoneNumber.dirty(super.value, {this.minLength = 6, this.maxLength})
      : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PhoneNumberError.empty) return 'El campo es obligatorio';
    if (displayError == PhoneNumberError.tooShort) {
      return 'El teléfono debe tener al menos $minLength dígitos';
    }
    if (displayError == PhoneNumberError.tooLong) {
      return 'El teléfono debe tener máximo $maxLength dígitos';
    }

    return null;
  }

  @override
  PhoneNumberError? validator(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return PhoneNumberError.empty;
    if (trimmed.length < minLength) return PhoneNumberError.tooShort;
    if (maxLength != null && trimmed.length > maxLength!) {
      return PhoneNumberError.tooLong;
    }

    return null;
  }
}
