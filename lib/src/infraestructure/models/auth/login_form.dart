class LoginFormResponse {
  String ok;
  List<LoginFormFieldModel> fields;

  LoginFormResponse({required this.ok, required this.fields});

  factory LoginFormResponse.fromJson(Map<String, dynamic> json) => LoginFormResponse(
        ok: json["ok"]?.toString() ?? 'true',
        fields: json["fields"] != null
            ? List<LoginFormFieldModel>.from(
                json["fields"].map((x) => LoginFormFieldModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "fields": fields.map((x) => x.toJson()).toList(),
      };
}

class LoginFormFieldModel {
  static const _knownKeys = {
    '_type',
    'field_type',
    'name',
    'label',
    'required_field',
    'unique_field',
  };

  final String type;
  final String fieldType;
  final String name;
  final String label;
  final bool requiredField;
  final bool uniqueField;
  final Map<String, dynamic> properties;

  LoginFormFieldModel({
    required this.type,
    required this.fieldType,
    required this.name,
    required this.label,
    required this.requiredField,
    required this.uniqueField,
    this.properties = const {},
  });

  factory LoginFormFieldModel.fromJson(Map<String, dynamic> json) => LoginFormFieldModel(
        type: json["_type"] ?? '',
        fieldType: json["field_type"] ?? '',
        name: json["name"] ?? '',
        label: json["label"] ?? '',
        requiredField: json["required_field"] ?? false,
        uniqueField: json["unique_field"] ?? false,
        properties: Map<String, dynamic>.from(json)
          ..removeWhere((key, _) => _knownKeys.contains(key)),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "field_type": fieldType,
        "name": name,
        "label": label,
        "required_field": requiredField,
        "unique_field": uniqueField,
        ...properties,
      };
}

class ParticipantLoginRequirementsResponse {
  String ok;
  bool allowed;
  String redirectPage;
  String message;

  ParticipantLoginRequirementsResponse({
    required this.ok,
    required this.allowed,
    required this.redirectPage,
    required this.message,
  });

  factory ParticipantLoginRequirementsResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantLoginRequirementsResponse(
        ok: json["ok"]?.toString() ?? 'true',
        allowed: json["allowed"] ?? false,
        redirectPage: json["redirect_page"]?.toString() ?? '',
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "allowed": allowed,
        "redirect_page": redirectPage,
        "message": message,
      };
}
