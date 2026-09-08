class RewardCheckResponse {
  String ok;
  DataRewardCheck data;

  RewardCheckResponse({required this.ok, required this.data});

  factory RewardCheckResponse.fromJson(Map<String, dynamic> json) =>
      RewardCheckResponse(
        ok: json["ok"],
        data: DataRewardCheck.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "data": data.toJson()};
}

class DataRewardCheck {
  final Prize prize;
  final ParticipantCheck participantCheck;
  final List<ExtraForm>? extraForm;

  DataRewardCheck({
    required this.prize,
    required this.participantCheck,
    this.extraForm,
  });

  factory DataRewardCheck.fromJson(Map<String, dynamic> json) =>
      DataRewardCheck(
        prize: Prize.fromJson(json["prize"]),
        participantCheck: ParticipantCheck.fromJson(json["participant_check"]),
        extraForm: json["extra_form"] == null
            ? null
            : List<ExtraForm>.from(
                (json["extra_form"] as List).map((x) => ExtraForm.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "prize": prize.toJson(),
        "participant_check": participantCheck.toJson(),
        if (extraForm != null)
          "extra_form": extraForm!.map((x) => x.toJson()).toList(),
      };
}

class ExtraForm {
  String formName;
  List<Field> fields;

  ExtraForm({required this.formName, required this.fields});

  factory ExtraForm.fromJson(Map<String, dynamic> json) => ExtraForm(
        formName: json["form_name"],
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "form_name": formName,
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
      };
}

class Field {
  String name;
  String type;
  bool requiredField;

  Field({required this.name, required this.type, required this.requiredField});

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["_type"],
        requiredField: json["required_field"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "_type": type,
        "required_field": requiredField,
      };
}

class ParticipantCheck {
  int missingPoints;
  dynamic missingLevel;
  dynamic missingBadges;
  dynamic missingRule;
  bool userOverlimit;
  bool canRedeem;
  String message;

  ParticipantCheck({
    required this.missingPoints,
    required this.missingLevel,
    required this.missingBadges,
    required this.missingRule,
    required this.userOverlimit,
    required this.canRedeem,
    required this.message,
  });

  factory ParticipantCheck.fromJson(Map<String, dynamic> json) =>
      ParticipantCheck(
        missingPoints: json["missing_points"],
        missingLevel: json["missing_level"],
        missingBadges: json["missing_badges"],
        missingRule: json["missing_rule"],
        userOverlimit: json["user_overlimit"],
        canRedeem: json["can_redeem"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "missing_points": missingPoints,
        "missing_level": missingLevel,
        "missing_badges": missingBadges,
        "missing_rule": missingRule,
        "user_overlimit": userOverlimit,
        "can_redeem": canRedeem,
        "message": message,
      };
}

class Prize {
  String type;
  String name;
  String description;
  int points;
  bool isRedeemable;
  bool isAvailable;
  bool requireExtraForm;

  Prize({
    required this.type,
    required this.name,
    required this.description,
    required this.points,
    required this.isRedeemable,
    required this.isAvailable,
    required this.requireExtraForm,
  });

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        type: json["_type"],
        name: json["name"],
        description: json["description"],
        points: json["points"],
        isRedeemable: json["is_redeemable"],
        isAvailable: json["is_available"],
        requireExtraForm: json["require_extra_form"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "name": name,
        "description": description,
        "points": points,
        "is_redeemable": isRedeemable,
        "is_available": isAvailable,
        "require_extra_form": requireExtraForm,
      };
}
