import '../participant/participant.dart';

class ListCommentsResponse {
  String ok;
  ListCommentsData data;

  ListCommentsResponse({required this.ok, required this.data});

  factory ListCommentsResponse.fromJson(Map<String, dynamic> json) => ListCommentsResponse(
        ok: json["ok"]?.toString() ?? 'true',
        data: ListCommentsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "data": data.toJson()};
}

class ListCommentsData {
  int page;
  int pageSize;
  int totalPages;
  int totalData;
  List<CommentModel> comments;

  ListCommentsData({
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.comments,
  });

  factory ListCommentsData.fromJson(Map<String, dynamic> json) => ListCommentsData(
        page: json["page"] ?? 1,
        pageSize: json["page_size"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        totalData: json["total_data"] ?? 0,
        comments: json["comments"] != null
            ? List<CommentModel>.from(json["comments"].map((x) => CommentModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "comments": comments.map((x) => x.toJson()).toList(),
      };
}

class CommentModel {
  String id;
  bool admin;
  bool archived;
  String atype;
  String category;
  DateTime executeDate;
  int extraPoints;
  String moderation;
  String ownerName;
  int points;
  String state;
  dynamic team;
  Participant participant;
  dynamic editableBy;
  dynamic deleteableBy;
  bool voted;
  String body;
  List<String> tags;
  List<String> participantsTags;

  CommentModel({
    required this.id,
    required this.admin,
    required this.archived,
    required this.atype,
    required this.category,
    required this.executeDate,
    required this.extraPoints,
    required this.moderation,
    required this.ownerName,
    required this.points,
    required this.state,
    required this.team,
    required this.participant,
    required this.editableBy,
    required this.deleteableBy,
    required this.voted,
    required this.body,
    required this.tags,
    required this.participantsTags,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["_id"] ?? '',
        admin: json["admin"] ?? false,
        archived: json["archived"] ?? false,
        atype: json["atype"] ?? '',
        category: json["category"]?.toString() ?? '',
        executeDate: DateTime.parse(json["execute_date"]),
        extraPoints: json["extra_points"] ?? 0,
        moderation: json["moderation"] ?? '',
        ownerName: json["owner_name"]?.toString() ?? '',
        points: json["points"] ?? 0,
        state: json["state"] ?? '',
        team: json["team"],
        participant: Participant.fromJson(json["participant"]),
        editableBy: json["editable_by"],
        deleteableBy: json["deleteable_by"],
        voted: json["voted"] ?? false,
        body: json["body"] ?? '',
        tags: json["tags"] != null ? List<String>.from(json["tags"].map((x) => x.toString())) : [],
        participantsTags: json["participants_tags"] != null
            ? List<String>.from(json["participants_tags"].map((x) => x.toString()))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "admin": admin,
        "archived": archived,
        "atype": atype,
        "category": category,
        "execute_date": executeDate.toIso8601String(),
        "extra_points": extraPoints,
        "moderation": moderation,
        "owner_name": ownerName,
        "points": points,
        "state": state,
        "team": team,
        "participant": participant.toJson(),
        "editable_by": editableBy,
        "deleteable_by": deleteableBy,
        "voted": voted,
        "body": body,
        "tags": tags,
        "participants_tags": participantsTags,
      };
}
