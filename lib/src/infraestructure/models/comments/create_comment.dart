import '../participant/participant.dart';

class CommentActivityResultResponse {
  String ok;
  String activityState;
  dynamic activityPoints;
  String message;
  String? executionError;
  CommentActivityModel object;

  CommentActivityResultResponse({
    required this.ok,
    required this.activityState,
    required this.activityPoints,
    required this.message,
    this.executionError,
    required this.object,
  });

  factory CommentActivityResultResponse.fromJson(Map<String, dynamic> json) =>
      CommentActivityResultResponse(
        ok: json["ok"]?.toString() ?? 'true',
        activityState: json["activity_state"]?.toString() ?? '',
        activityPoints: json["activity_points"],
        message: json["message"]?.toString() ?? '',
        executionError: json["execution_error"]?.toString(),
        object: CommentActivityModel.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "activity_state": activityState,
        "activity_points": activityPoints,
        "message": message,
        "execution_error": executionError,
        "object": object.toJson(),
      };
}

class CommentActivityModel {
  String id;
  String type;
  int activityCount;
  String atype;
  String category;
  String moderation;
  int points;
  String state;
  int createdAt;
  String module;
  String name;
  dynamic team;
  Participant participant;
  int votesCount;
  List<String> tags;
  List<String> participantsTags;
  String? pushRedirectUrl;

  CommentActivityModel({
    required this.id,
    required this.type,
    required this.activityCount,
    required this.atype,
    required this.category,
    required this.moderation,
    required this.points,
    required this.state,
    required this.createdAt,
    required this.module,
    required this.name,
    required this.team,
    required this.participant,
    required this.votesCount,
    required this.tags,
    required this.participantsTags,
    this.pushRedirectUrl,
  });

  factory CommentActivityModel.fromJson(Map<String, dynamic> json) => CommentActivityModel(
        id: json["_id"] ?? '',
        type: json["_type"] ?? '',
        activityCount: json["activity_count"] ?? 0,
        atype: json["atype"] ?? '',
        category: json["category"]?.toString() ?? '',
        moderation: json["moderation"] ?? '',
        points: json["points"] ?? 0,
        state: json["state"] ?? '',
        createdAt: json["created_at"] ?? 0,
        module: json["module"] ?? '',
        name: json["name"] ?? '',
        team: json["team"],
        participant: Participant.fromJson(json["participant"]),
        votesCount: json["votes_count"] ?? 0,
        tags: json["tags"] != null ? List<String>.from(json["tags"].map((x) => x.toString())) : [],
        participantsTags: json["participants_tags"] != null
            ? List<String>.from(json["participants_tags"].map((x) => x.toString()))
            : [],
        pushRedirectUrl: json["push_redirect_url"],
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
        "module": module,
        "name": name,
        "team": team,
        "participant": participant.toJson(),
        "votes_count": votesCount,
        "tags": tags,
        "participants_tags": participantsTags,
        "push_redirect_url": pushRedirectUrl,
      };
}
