import 'dart:convert';

GetBlogsResponse getBlogsResponseFromJson(String str) => GetBlogsResponse.fromJson(json.decode(str));

String getBlogsResponseToJson(GetBlogsResponse data) => json.encode(data.toJson());

class GetBlogsResponse {
    String ok;
    GetBlogsData data;

    GetBlogsResponse({
        required this.ok,
        required this.data,
    });

    factory GetBlogsResponse.fromJson(Map<String, dynamic> json) => GetBlogsResponse(
        ok: json["ok"],
        data: GetBlogsData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class GetBlogsData {
    int page;
    int pageSize;
    int totalPages;
    int totalData;
    List<BlogPost> blogPosts;

    GetBlogsData({
        required this.page,
        required this.pageSize,
        required this.totalPages,
        required this.totalData,
        required this.blogPosts,
    });

    factory GetBlogsData.fromJson(Map<String, dynamic> json) => GetBlogsData(
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        blogPosts: List<BlogPost>.from(json["blog_posts"].map((x) => BlogPost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "blog_posts": List<dynamic>.from(blogPosts.map((x) => x.toJson())),
    };
}

class BlogPost {
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
    GetBlogsParticipant participant;
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
    String? coverUrl;
    String? videoCoverUrl;

    BlogPost({
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
        this.coverUrl,
        this.videoCoverUrl,
    });

    factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
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
        participant: GetBlogsParticipant.fromJson(json["participant"]),
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
        coverUrl: json["cover_url"] as String?,
        videoCoverUrl: json["video_cover_url"] as String?,
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
        if (coverUrl != null) "cover_url": coverUrl,
        if (videoCoverUrl != null) "video_cover_url": videoCoverUrl,
    };
}

class GetBlogsParticipant {
    String id;
    String email;
    String name;
    String avatar;
    String uid;
    dynamic uidType;
    String state;

    GetBlogsParticipant({
        required this.id,
        required this.email,
        required this.name,
        required this.avatar,
        required this.uid,
        required this.uidType,
        required this.state,
    });

    factory GetBlogsParticipant.fromJson(Map<String, dynamic> json) => GetBlogsParticipant(
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
