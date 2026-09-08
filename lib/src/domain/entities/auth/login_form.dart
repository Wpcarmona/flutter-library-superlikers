/// Campo dinámico del formulario de login de la campaign (`POST
/// /sessions/loginform`). El schema de campos lo define cada campaign, así
/// que solo se tipan las llaves comunes a todos los `_type` de campo
/// (NumberField, PasswordField, EmailField, etc.); el resto del JSON del
/// campo (choices, min/max, pattern, confirm, etc.) queda en [properties].
class LoginFormField {
  final String type;
  final String fieldType;
  final String name;
  final String label;
  final bool requiredField;
  final bool uniqueField;
  final Map<String, dynamic> properties;

  LoginFormField({
    required this.type,
    required this.fieldType,
    required this.name,
    required this.label,
    required this.requiredField,
    required this.uniqueField,
    this.properties = const {},
  });
}

class LoginForm {
  final String ok;
  final List<LoginFormField> fields;

  LoginForm({required this.ok, required this.fields});
}

/// Respuesta de `POST /sessions/participant_login_requirements`: si el
/// participante autenticado cumple los requisitos configurados en la
/// campaign para poder seguir usando la app (ej. verificación de email
/// obligatoria, aceptar términos, etc.).
class ParticipantLoginRequirements {
  final String ok;
  final bool allowed;
  final String redirectPage;
  final String message;

  ParticipantLoginRequirements({
    required this.ok,
    required this.allowed,
    required this.redirectPage,
    required this.message,
  });
}
