import 'dart:convert';

CountVotesPublicationResponse countVotesPublicationResponseFromJson(String str) => CountVotesPublicationResponse.fromJson(json.decode(str));

String countVotesPublicationResponseToJson(CountVotesPublicationResponse data) => json.encode(data.toJson());

class CountVotesPublicationResponse {
    String ok;
    Data data;

    CountVotesPublicationResponse({
        required this.ok,
        required this.data,
    });

    factory CountVotesPublicationResponse.fromJson(Map<String, dynamic> json) => CountVotesPublicationResponse(
        ok: json["ok"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
    };
}

class Data {
    dynamic currentParticipantVotedCategory;
    int likes;
    int supports;
    int interests;
    int curiosities;

    Data({
        required this.currentParticipantVotedCategory,
        required this.likes,
        required this.supports,
        required this.interests,
        required this.curiosities,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentParticipantVotedCategory: json["current_participant_voted_category"],
        likes: (json["likes"] as num?)?.toInt() ?? 0,
        supports: (json["supports"] as num?)?.toInt() ?? 0,
        interests: (json["interests"] as num?)?.toInt() ?? 0,
        curiosities: (json["curiosities"] as num?)?.toInt() ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "current_participant_voted_category": currentParticipantVotedCategory,
        "likes": likes,
        "supports": supports,
        "interests": interests,
        "curiosities": curiosities,
    };
}
