import 'dart:convert';

DynamicFieldsResponse dynamicFieldsResponseFromJson(String str) =>
    DynamicFieldsResponse.fromJson(json.decode(str));

String dynamicFieldsResponseToJson(DynamicFieldsResponse data) => json.encode(data.toJson());

class DynamicFieldsResponse {
  final String ok;
  final DynamicFieldsData data;

  DynamicFieldsResponse({
    required this.ok,
    required this.data,
  });

  factory DynamicFieldsResponse.fromJson(Map<String, dynamic> json) => DynamicFieldsResponse(
        ok: json["ok"],
        data: DynamicFieldsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
      };
}

class DynamicFieldsData {
  final String id;
  final String externalAction;
  final int totalFields;
  final List<FieldEntityModel> fields;

  DynamicFieldsData({
    required this.id,
    required this.externalAction,
    required this.totalFields,
    required this.fields,
  });

  factory DynamicFieldsData.fromJson(Map<String, dynamic> json) => DynamicFieldsData(
        id: json["id"],
        externalAction: json["external_action"],
        totalFields: json["total_fields"],
        fields: List<FieldEntityModel>.from(
            json["fields"].map((x) => FieldEntityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "external_action": externalAction,
        "total_fields": totalFields,
        "fields": fields.map((x) => x.toJson()).toList(),
      };
}

/// Metadata extra por `field_type` que ya se modela con tipo propio;
/// cualquier otra clave que traiga un campo cae en [FieldEntityModel.properties].
const _knownFieldKeys = {
  'field_type',
  'type_value',
  'name',
  'label',
  'help_text',
  'placeholder',
  'default_value',
  'required_field',
  'unique_field',
  'format',
  'choices',
};

class FieldEntityModel {
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
  final List<ChoiceEntity>? choices;
  final Map<String, dynamic> properties;

  FieldEntityModel({
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

  factory FieldEntityModel.fromJson(Map<String, dynamic> json) => FieldEntityModel(
        fieldType: json["field_type"] ?? '',
        typeValue: json["type_value"] ?? '',
        name: json["name"] ?? '',
        label: json["label"] ?? '',
        helpText: json["help_text"],
        placeholder: json["placeholder"],
        defaultValue: json["default_value"],
        requiredField: json["required_field"] ?? false,
        uniqueField: json["unique_field"] ?? false,
        format: json["format"],
        choices: json["choices"] != null
            ? List<ChoiceEntity>.from(json["choices"].map((x) => ChoiceEntity.fromJson(x)))
            : null,
        properties: Map<String, dynamic>.from(json)
          ..removeWhere((key, _) => _knownFieldKeys.contains(key)),
      );

  Map<String, dynamic> toJson() => {
        "field_type": fieldType,
        "type_value": typeValue,
        "name": name,
        "label": label,
        "help_text": helpText,
        "placeholder": placeholder,
        "default_value": defaultValue,
        "required_field": requiredField,
        "unique_field": uniqueField,
        "format": format,
        "choices": choices?.map((x) => x.toJson()).toList(),
        ...properties,
      };
}

class ChoiceEntity {
  final String label;
  final String value;

  ChoiceEntity({
    required this.label,
    required this.value,
  });

  factory ChoiceEntity.fromJson(Map<String, dynamic> json) => ChoiceEntity(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
