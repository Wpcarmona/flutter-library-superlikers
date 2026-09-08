import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  final RegExp pattern;

  static final RegExp defaultPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  Email.pure({RegExp? pattern})
      : pattern = pattern ?? defaultPattern,
        super.pure('');

  Email.dirty(String value, {RegExp? pattern})
      : pattern = pattern ?? defaultPattern,
        super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'El campo es obligatorio';
    if (displayError == EmailError.format) {
      return 'No tiene formato de correo electronico';
    }

    return null;
  }

  @override
  EmailError? validator(String value) {
    if (value.trim().isEmpty) return EmailError.empty;
    if (!pattern.hasMatch(value)) return EmailError.format;

    return null;
  }
}
