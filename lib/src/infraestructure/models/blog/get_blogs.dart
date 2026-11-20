import '../utils/json_read.dart';
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
        ok: readString(json["ok"]),
        data: GetBlogsData.fromJson(readMap(json["data"])),
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
        page: readInt(json["page"]),
        pageSize: readInt(json["page_size"]),
        totalPages: readInt(json["total_pages"]),
        totalData: readInt(json["total_data"]),
        blogPosts: [for (final x in (json["blog_posts"] is List ? json["blog_posts"] as List : const [])) if (x is Map) BlogPost.fromJson(Map<String, dynamic>.from(x))],
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
  Map<String, dynamic> raw;

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
    this.raw = const {},
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
        raw: json,
        id: readString(json["_id"]),
        admin: readBool(json["admin"]),
        archived: readBool(json["archived"]),
        atype: readString(json["atype"]),
        category: readString(json["category"]),
        executeDate: readDate(json["execute_date"]),
        extraPoints: readInt(json["extra_points"]),
        moderation: readString(json["moderation"]),
        ownerName: readString(json["owner_name"]),
        points: readInt(json["points"]),
        state: readString(json["state"]),
        team: json["team"],
        participant: GetBlogsParticipant.fromJson(readMap(json["participant"])),
        permalink: readString(json["permalink"]),
        shortUrl: json["short_url"],
        facebookTabUrl: json["facebook_tab_url"],
        votesCount: readInt(json["votes_count"]),
        votesAverage: readInt(json["votes_average"]),
        votesUp: readInt(json["votes_up"]),
        votesDown: readInt(json["votes_down"]),
        title: readString(json["title"]),
        body: readString(json["body"]),
        editableBy: json["editable_by"],
        deleteableBy: json["deleteable_by"],
        createdAt: readInt(json["created_at"]),
        format: readString(json["format"]),
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
        id: readString(json["_id"]),
        email: readString(json["email"]),
        name: readString(json["name"]),
        avatar: readString(json["avatar"]),
        uid: readString(json["uid"]),
        uidType: json["uid_type"],
        state: readString(json["state"]),
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
