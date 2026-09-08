import 'dart:convert';

GetBlogResponse getBlogResponseFromJson(String str) => GetBlogResponse.fromJson(json.decode(str));

String getBlogResponseToJson(GetBlogResponse data) => json.encode(data.toJson());

class GetBlogResponse {
    String ok;
    GetBlogObject object;

    GetBlogResponse({
        required this.ok,
        required this.object,
    });

    factory GetBlogResponse.fromJson(Map<String, dynamic> json) => GetBlogResponse(
        ok: json["ok"],
        object: GetBlogObject.fromJson(json["object"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "object": object.toJson(),
    };
}

class GetBlogObject {
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
    GetBlogParticipant participant;
    String permalink;
    dynamic shortUrl;
    dynamic facebookTabUrl;
    int votesCount;
    int votesAverage;
    int votesUp;
    int votesDown;
    String title;
    String body;
    dynamic editableBy;
    dynamic deleteableBy;
    int createdAt;
    String format;
    List<dynamic> tags;
    List<dynamic> participantsTags;

    GetBlogObject({
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
        required this.permalink,
        required this.shortUrl,
        required this.facebookTabUrl,
        required this.votesCount,
        required this.votesAverage,
        required this.votesUp,
        required this.votesDown,
        required this.title,
        required this.body,
        required this.editableBy,
        required this.deleteableBy,
        required this.createdAt,
        required this.format,
        required this.tags,
        required this.participantsTags,
    });

    factory GetBlogObject.fromJson(Map<String, dynamic> json) => GetBlogObject(
        id: json["_id"],
        admin: json["admin"],
        archived: json["archived"],
        atype: json["atype"],
        category: json["category"],
        executeDate: DateTime.parse(json["execute_date"]),
        extraPoints: json["extra_points"],
        moderation: json["moderation"],
        ownerName: json["owner_name"],
        points: json["points"],
        state: json["state"],
        team: json["team"],
        participant: GetBlogParticipant.fromJson(json["participant"]),
        permalink: json["permalink"],
        shortUrl: json["short_url"],
        facebookTabUrl: json["facebook_tab_url"],
        votesCount: json["votes_count"],
        votesAverage: json["votes_average"],
        votesUp: json["votes_up"],
        votesDown: json["votes_down"],
        title: json["title"],
        body: json["body"],
        editableBy: json["editable_by"],
        deleteableBy: json["deleteable_by"],
        createdAt: json["created_at"],
        format: json["format"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        participantsTags: List<dynamic>.from(json["participants_tags"].map((x) => x)),
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
        "permalink": permalink,
        "short_url": shortUrl,
        "facebook_tab_url": facebookTabUrl,
        "votes_count": votesCount,
        "votes_average": votesAverage,
        "votes_up": votesUp,
        "votes_down": votesDown,
        "title": title,
        "body": body,
        "editable_by": editableBy,
        "deleteable_by": deleteableBy,
        "created_at": createdAt,
        "format": format,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "participants_tags": List<dynamic>.from(participantsTags.map((x) => x)),
    };
}

class GetBlogParticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    dynamic uidType;
    String state;

    GetBlogParticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory GetBlogParticipant.fromJson(Map<String, dynamic> json) => GetBlogParticipant(
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
