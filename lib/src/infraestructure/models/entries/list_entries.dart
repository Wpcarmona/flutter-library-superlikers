import 'dart:convert';

EntriesResponseApi activeChallengesResponseFromJson(String str) =>
    EntriesResponseApi.fromJson(json.decode(str));

String activeChallengesResponseToJson(EntriesResponseApi data) =>
    json.encode(data.toJson());

class EntriesResponseApi {
  String ok;
  ActiveChallengesResponseData data;

  EntriesResponseApi({
    required this.ok,
    required this.data,
  });

  factory EntriesResponseApi.fromJson(Map<String, dynamic> json) => EntriesResponseApi(
        ok: json["ok"] ?? '',
        data: ActiveChallengesResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.toJson(),
      };
}

class ActiveChallengesResponseData {
  double previousPageToken;
  double nextPageToken;
  List<EntriesActiviyResponse> entries;

  ActiveChallengesResponseData({
    required this.previousPageToken,
    required this.nextPageToken,
    required this.entries,
  });

  factory ActiveChallengesResponseData.fromJson(Map<String, dynamic> json) =>
      ActiveChallengesResponseData(
        previousPageToken: json["previous_page_token"]?.toDouble() ?? 0.0,
        nextPageToken: json["next_page_token"]?.toDouble() ?? 0.0,
        entries: List<EntriesActiviyResponse>.from(
            json["entries"].map((x) => EntriesActiviyResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "previous_page_token": previousPageToken,
        "next_page_token": nextPageToken,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };
}

// External events store data under "properties"; regular entries use "data".
// Prefer non-empty "data", fall back to "properties".
EntryData _parseEntryData(Map<String, dynamic> json) {
  final data = json["data"];
  if (data is Map && data.isNotEmpty) return EntryData.fromJson(Map<String, dynamic>.from(data));
  final props = json["properties"];
  if (props is Map && props.isNotEmpty) return EntryData.fromJson(Map<String, dynamic>.from(props));
  return EntryData(data: {});
}

class EntriesActiviyResponse {
  int activityCount;
  String category;
  DateTime createdAt;
  String moderation;
  num points;
  String state;
  String id;
  String slug;
  String name;
  ParticipantDataEntries participant;
  bool asForm;
  EntryData data;
  EntryPrizeResponse? prize;
  String? redemptionState;
  String? source;
  bool gift;
  EntryRedemptionResponse? redemption;

  EntriesActiviyResponse({
    required this.activityCount,
    required this.category,
    required this.createdAt,
    required this.moderation,
    required this.points,
    required this.state,
    required this.id,
    required this.slug,
    required this.name,
    required this.participant,
    required this.asForm,
    required this.data,
    this.prize,
    this.redemptionState,
    this.source,
    this.gift = false,
    this.redemption,
  });

  factory EntriesActiviyResponse.fromJson(Map<String, dynamic> json) => EntriesActiviyResponse(
        activityCount: (json["activity_count"] as num?)?.toInt() ?? 0,
        category: json["category"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        moderation: json["moderation"] ?? "",
        points: (json["points"] as num?) ?? 0,
        state: json["state"] ?? "",
        id: json["id"] ?? "",
        slug: json["slug"] ?? "",
        name: json["name"] ?? "",
        participant: json["participant"] != null
            ? ParticipantDataEntries.fromJson(json["participant"])
            : ParticipantDataEntries(id: '', email: '', name: '', avatar: '', uid: ''),
        asForm: json["as_form"] ?? false,
        data: _parseEntryData(json),
        prize: json["prize"] != null ? EntryPrizeResponse.fromJson(json["prize"]) : null,
        redemptionState: json["redemption_state"],
        source: json["source"],
        gift: json["gift"] ?? false,
        redemption: json["redemption"] != null
            ? EntryRedemptionResponse.fromJson(json["redemption"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "activity_count": activityCount,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "moderation": moderation,
        "points": points,
        "state": state,
        "id": id,
        "slug": slug,
        "name": name,
        "participant": participant.toJson(),
        "as_form": asForm,
        "data": data.toJson(),
        if (prize != null) "prize": prize!.toJson(),
        if (redemptionState != null) "redemption_state": redemptionState,
        if (source != null) "source": source,
        "gift": gift,
        if (redemption != null) "redemption": redemption!.toJson(),
      };
}

class EntryRedemptionResponse {
  String id;
  DateTime createdAt;
  num points;
  String? prizeName;
  String? code;
  String? state;

  EntryRedemptionResponse({
    required this.id,
    required this.createdAt,
    required this.points,
    this.prizeName,
    this.code,
    this.state,
  });

  factory EntryRedemptionResponse.fromJson(Map<String, dynamic> json) => EntryRedemptionResponse(
        id: json["_id"] ?? '',
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        points: (json["points"] as num?) ?? 0,
        prizeName: json["prize_name"],
        code: json["code"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "created_at": createdAt.toIso8601String(),
        "points": points,
        if (prizeName != null) "prize_name": prizeName,
        if (code != null) "code": code,
        if (state != null) "state": state,
      };
}

class EntryPrizeResponse {
  String id;
  String type;
  String category;
  String description;
  String name;
  num points;
  String imageUrl;
  String prizeImageUrl;
  bool redeemable;
  List<String> tags;
  String tc;
  num quantity;
  num quantityAvailable;
  num expirationDays;
  bool unlimited;
  String? eid;
  EntryPrizeDetailsResponse? prizeDetails;

  EntryPrizeResponse({
    required this.id,
    required this.type,
    required this.category,
    required this.description,
    required this.name,
    required this.points,
    required this.imageUrl,
    required this.prizeImageUrl,
    required this.redeemable,
    required this.tags,
    required this.tc,
    required this.quantity,
    required this.quantityAvailable,
    required this.expirationDays,
    required this.unlimited,
    this.eid,
    this.prizeDetails,
  });

  factory EntryPrizeResponse.fromJson(Map<String, dynamic> json) => EntryPrizeResponse(
        id: json["_id"] ?? '',
        type: json["_type"] ?? '',
        category: json["category"] ?? '',
        description: json["description"] ?? '',
        name: json["name"] ?? '',
        points: (json["points"] as num?) ?? 0,
        imageUrl: json["image_url"] ?? '',
        prizeImageUrl: json["prize_image_url"] ?? '',
        redeemable: json["redeemable"] ?? false,
        tags: json["tags"] != null
            ? List<String>.from(json["tags"].map((x) => x.toString()))
            : [],
        tc: json["tc"] ?? '',
        quantity: (json["quantity"] as num?) ?? 0,
        quantityAvailable: (json["quantity_available"] as num?) ?? 0,
        expirationDays: (json["expiration_days"] as num?) ?? 0,
        unlimited: json["unlimited"] ?? false,
        eid: json["eid"],
        prizeDetails: json["prize_details"] != null
            ? EntryPrizeDetailsResponse.fromJson(json["prize_details"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "category": category,
        "description": description,
        "name": name,
        "points": points,
        "image_url": imageUrl,
        "prize_image_url": prizeImageUrl,
        "redeemable": redeemable,
        "tags": tags,
        "tc": tc,
        "quantity": quantity,
        "quantity_available": quantityAvailable,
        "expiration_days": expirationDays,
        "unlimited": unlimited,
        if (eid != null) "eid": eid,
        if (prizeDetails != null) "prize_details": prizeDetails!.toJson(),
      };
}

class EntryPrizeDetailsResponse {
  String value;
  String description;

  EntryPrizeDetailsResponse({required this.value, required this.description});

  factory EntryPrizeDetailsResponse.fromJson(Map<String, dynamic> json) => EntryPrizeDetailsResponse(
        value: json["value"]?.toString() ?? '',
        description: json["description"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"value": value, "description": description};
}

class EntryData {
  Map<String, dynamic> data;

  EntryData({
    required this.data,
  });

  factory EntryData.fromJson(Map<String, dynamic> json) => EntryData(
        data: json,
      );

  Map<String, dynamic> toJson() => data;
}

class ParticipantDataEntries {
  String id;
  String email;
  String name;
  String avatar;
  String uid;

  ParticipantDataEntries({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.uid,
  });

  factory ParticipantDataEntries.fromJson(Map<String, dynamic> json) => ParticipantDataEntries(
        id: json["id"] ?? json["_id"] ?? '',
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        avatar: json["avatar"] ?? '',
        uid: json["uid"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "uid": uid,
      };
}
