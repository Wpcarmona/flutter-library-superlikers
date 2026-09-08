import 'dart:convert';

UpdateBlogResponse updateResponseFromJson(String str) => UpdateBlogResponse.fromJson(json.decode(str));

String updateResponseToJson(UpdateBlogResponse data) => json.encode(data.toJson());

class UpdateBlogResponse {
    String ok;
    String activityState;
    int activityPoints;
    String message;
    String executionError;
    UpdateBlogObject object;

    UpdateBlogResponse({
        required this.ok,
        required this.activityState,
        required this.activityPoints,
        required this.message,
        required this.executionError,
        required this.object,
    });

    factory UpdateBlogResponse.fromJson(Map<String, dynamic> json) => UpdateBlogResponse(
        ok: json["ok"],
        activityState: json["activity_state"],
        activityPoints: json["activity_points"],
        message: json["message"],
        executionError: json["execution_error"],
        object: UpdateBlogObject.fromJson(json["object"]),
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

class UpdateBlogObject {
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
    UpdateBlogParticipant participant;
    int votesCount;
    String title;
    String format;
    List<String> tags;
    List<String> participantsTags;
    List<dynamic> files;
    String pushRedirectUrl;

    UpdateBlogObject({
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
        required this.title,
        required this.format,
        required this.tags,
        required this.participantsTags,
        required this.files,
        required this.pushRedirectUrl,
    });

    factory UpdateBlogObject.fromJson(Map<String, dynamic> json) => UpdateBlogObject(
        id: json["_id"],
        type: json["_type"],
        activityCount: json["activity_count"],
        atype: json["atype"],
        category: json["category"],
        moderation: json["moderation"],
        points: json["points"],
        state: json["state"],
        createdAt: json["created_at"],
        module: json["module"],
        name: json["name"],
        team: json["team"],
        participant: UpdateBlogParticipant.fromJson(json["participant"]),
        votesCount: json["votes_count"],
        title: json["title"],
        format: json["format"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        participantsTags: List<String>.from(json["participants_tags"].map((x) => x)),
        files: List<dynamic>.from(json["files"].map((x) => x)),
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
        "title": title,
        "format": format,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "participants_tags": List<dynamic>.from(participantsTags.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x)),
        "push_redirect_url": pushRedirectUrl,
    };
}

class UpdateBlogParticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    String uidType;
    String state;

    UpdateBlogParticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory UpdateBlogParticipant.fromJson(Map<String, dynamic> json) => UpdateBlogParticipant(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        uid: json["uid"],
        uidType: json["uid_type"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "uid": uid,
        "uid_type": uidType,
        "state": state,
    };
}
