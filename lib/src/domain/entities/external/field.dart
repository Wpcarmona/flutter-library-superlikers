class FieldEntityField {
  final String fieldType;
  final String typeValue;
  final String name;
  final String label;
  final String? helpText;
  final String? placeholder;
  final dynamic defaultValue;
  final bool requiredField;
  final bool uniqueField;
  final String? format;
  final List<ChoiceField>? choices;

  /// Cualquier otra clave que traiga este campo además de las de arriba.
  /// Los `field_type` (`text`, `date`, `select`, `check_box_group`, `file`,
  /// etc.) no tienen un set fijo de metadata extra — `format`/`choices` son
  /// las dos que ya se ven seguido, pero un `field_type` nuevo puede traer
  /// otra clave distinta; queda disponible aquí tal cual vino del JSON en
  /// vez de perderse.
  final Map<String, dynamic> properties;

  FieldEntityField({
    required this.fieldType,
    required this.typeValue,
    required this.name,
    required this.label,
    this.helpText,
    this.placeholder,
    this.defaultValue,
    required this.requiredField,
    required this.uniqueField,
    this.format,
    this.choices,
    this.properties = const {},
  });
}

class ChoiceField {
  final String label;
  final String value;

  ChoiceField({
    required this.label,
    required this.value,
  });
}
