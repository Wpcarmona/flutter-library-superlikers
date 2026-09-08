import '../participant/participant.dart';

class ExternalFormInfoResponse {
  String ok;
  ExternalFormActivityModel data;

  ExternalFormInfoResponse({required this.ok, required this.data});

  factory ExternalFormInfoResponse.fromJson(Map<String, dynamic> json) =>
      ExternalFormInfoResponse(
        ok: json["ok"]?.toString() ?? 'true',
        data: ExternalFormActivityModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "data": data.toJson()};
}

class ExternalFormActivityListResponse {
  String ok;
  int totalData;
  int page;
  int pageSize;
  int totalPages;
  List<ExternalFormActivityModel> externalForms;

  ExternalFormActivityListResponse({
    required this.ok,
    required this.totalData,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.externalForms,
  });

  factory ExternalFormActivityListResponse.fromJson(Map<String, dynamic> json) =>
      ExternalFormActivityListResponse(
        ok: json["ok"]?.toString() ?? 'true',
        totalData: json["total_data"] ?? 0,
        page: json["page"] ?? 1,
        pageSize: json["page_size"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        externalForms: json["external_forms"] != null
            ? List<ExternalFormActivityModel>.from(
                json["external_forms"].map((x) => ExternalFormActivityModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "total_data": totalData,
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "external_forms": externalForms.map((x) => x.toJson()).toList(),
      };
}

class ExternalFormActivityModel {
  static const _knownKeys = {
    '_id',
    '_type',
    'activity_count',
    'atype',
    'category',
    'moderation',
    'points',
    'state',
    'created_at',
    'execute_date',
    'module',
    'name',
    'team',
    'participant',
  };

  String id;
  String type;
  int activityCount;
  String atype;
  String? category;
  String moderation;
  num points;
  String state;
  int createdAt;
  int executeDate;
  String module;
  String name;
  dynamic team;
  Participant participant;
  Map<String, dynamic> properties;

  ExternalFormActivityModel({
    required this.id,
    required this.type,
    required this.activityCount,
    required this.atype,
    this.category,
    required this.moderation,
    required this.points,
    required this.state,
    required this.createdAt,
    required this.executeDate,
    required this.module,
    required this.name,
    required this.team,
    required this.participant,
    this.properties = const {},
  });

  factory ExternalFormActivityModel.fromJson(Map<String, dynamic> json) =>
      ExternalFormActivityModel(
        id: json["_id"] ?? '',
        type: json["_type"] ?? '',
        activityCount: json["activity_count"] ?? 0,
        atype: json["atype"] ?? '',
        category: json["category"],
        moderation: json["moderation"] ?? '',
        points: json["points"] ?? 0,
        state: json["state"] ?? '',
        createdAt: json["created_at"] ?? 0,
        executeDate: json["execute_date"] ?? 0,
        module: json["module"] ?? '',
        name: json["name"] ?? '',
        team: json["team"],
        participant: Participant.fromJson(json["participant"]),
        properties: Map<String, dynamic>.from(json)
          ..removeWhere((key, _) => _knownKeys.contains(key)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "activity_count": activityCount,
        "atype": atype,
        "category": category,
        "moderation": moderation,
        "points": points,
        "state": state,
        "created_at": createdAt,
        "execute_date": executeDate,
        "module": module,
        "name": name,
        "team": team,
        "participant": participant.toJson(),
        ...properties,
      };
}
