import 'package:formz/formz.dart';

enum NumberDocumentError { empty, tooShort, tooLong }

class NumberDocument extends FormzInput<String, NumberDocumentError> {
  final int minLength;
  final int? maxLength;

  const NumberDocument.pure({this.minLength = 6, this.maxLength}) : super.pure('');

  const NumberDocument.dirty(String value, {this.minLength = 6, this.maxLength})
      : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == NumberDocumentError.empty) return 'El campo es obligatorio';
    if (displayError == NumberDocumentError.tooShort) {
      return 'El campo debe tener al menos $minLength caracteres';
    }
    if (displayError == NumberDocumentError.tooLong) {
      return 'El campo debe tener máximo $maxLength caracteres';
    }

    return null;
  }

  @override
  NumberDocumentError? validator(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return NumberDocumentError.empty;
    if (trimmed.length < minLength) return NumberDocumentError.tooShort;
    if (maxLength != null && trimmed.length > maxLength!) {
      return NumberDocumentError.tooLong;
    }

    return null;
  }
}
