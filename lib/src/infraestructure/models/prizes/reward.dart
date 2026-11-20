import '../utils/json_read.dart';

class RewardResponse {
  String ok;
  int page;
  int pageSize;
  int totalPages;
  int totalData;
  List<ObjectReward> object;

  RewardResponse({
    required this.ok,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.object,
  });

  factory RewardResponse.fromJson(Map<String, dynamic> json) => RewardResponse(
        ok: readString(json["ok"]),
        page: readInt(json["page"]),
        pageSize: readInt(json["page_size"]),
        totalPages: readInt(json["total_pages"]),
        totalData: readInt(json["total_data"]),
        object: [for (final x in (json["object"] is List ? json["object"] as List : const [])) if (x is Map) ObjectReward.fromJson(Map<String, dynamic>.from(x))],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "object": List<dynamic>.from(object.map((x) => x.toJson())),
      };
}

class ObjectReward {
  Map<String, dynamic> raw;

  String id;
  String type;
  String category;
  String description;
  int expirationDays;
  String name;
  int points;
  String prizeImageUrl;
  int quantity;
  dynamic quantityLimitTimeframe;
  bool redeemable;
  bool requireRedemptionToken;
  List<String> tags;
  String tc;
  bool unlimited;
  bool usePointType;
  int userLimit;
  String userLimitTimeframe;
  List<dynamic> filter;
  int quantityAvailable;
  String imageUrl;
  dynamic pointType;
  dynamic pointTypeId;
  dynamic sponsor;
  dynamic sponsorId;
  int size;
  bool useCodesVault;
  bool available;
  bool isCouponPrize;
  String redeemUrl;
  String eid;
  String addonId;
  MetadataReward metadata;
  PrizeDetails prizeDetails;
  List<dynamic> extraFields;
  bool isExternalCouponPrize;
  List<dynamic> customData;
  bool shipping;
  bool isCustomPrize;

  ObjectReward({
    this.raw = const {},
    required this.id,
    required this.type,
    required this.category,
    required this.description,
    required this.expirationDays,
    required this.name,
    required this.points,
    required this.prizeImageUrl,
    required this.quantity,
    required this.quantityLimitTimeframe,
    required this.redeemable,
    required this.requireRedemptionToken,
    required this.tags,
    required this.tc,
    required this.unlimited,
    required this.usePointType,
    required this.userLimit,
    required this.userLimitTimeframe,
    required this.filter,
    required this.quantityAvailable,
    required this.imageUrl,
    required this.pointType,
    required this.pointTypeId,
    required this.sponsor,
    required this.sponsorId,
    required this.size,
    required this.useCodesVault,
    required this.available,
    required this.isCouponPrize,
    required this.redeemUrl,
    required this.eid,
    required this.addonId,
    required this.metadata,
    required this.prizeDetails,
    required this.extraFields,
    required this.isExternalCouponPrize,
    required this.customData,
    required this.shipping,
    required this.isCustomPrize,
  });

  factory ObjectReward.fromJson(Map<String, dynamic> json) => ObjectReward(
        raw: json,
        id: readString(json["_id"], ''),
        type: readString(json["_type"], ''),
        category: readString(json["category"], ''),
        description: readString(json["description"], ''),
        expirationDays: readInt(json["expiration_days"], 0),
        name: readString(json["name"], ''),
        points: readInt(json["points"], 0),
        prizeImageUrl: readString(json["prize_image_url"], ''),
        quantity: readInt(json["quantity"], 0),
        quantityLimitTimeframe: json["quantity_limit_timeframe"],
        redeemable: readBool(json["redeemable"], false),
        requireRedemptionToken: readBool(json["require_redemption_token"], false),
        tags: readStringList(json["tags"]),
        tc: readString(json["tc"], ''),
        unlimited: readBool(json["unlimited"], false),
        usePointType: readBool(json["use_point_type"], false),
        userLimit: readInt(json["user_limit"], 0),
        userLimitTimeframe: readString(json["user_limit_timeframe"], ''),
        filter: (json["filter"] is List ? List<dynamic>.from(json["filter"] as List) : <dynamic>[]),
        quantityAvailable: readInt(json["quantity_available"], 0),
        imageUrl: readString(json["image_url"], json["prize_image_url"] ?? ''),
        pointType: json["point_type"],
        pointTypeId: json["point_type_id"],
        sponsor: json["sponsor"],
        sponsorId: json["sponsor_id"],
        size: readInt(json["size"], 0),
        useCodesVault: readBool(json["use_codes_vault"], false),
        available: readBool(json["available"], true),
        isCouponPrize: readBool(json["is_coupon_prize"], false),
        redeemUrl: readString(json["redeem_url"], ''),
        eid: readString(json["eid"], ''),
        addonId: readString(json["addon_id"], ''),
        metadata: json["metadata"] != null
            ? MetadataReward.fromJson(readMap(json["metadata"]))
            : MetadataReward.empty(),
        prizeDetails: json["prize_details"] != null
            ? PrizeDetails.fromJson(readMap(json["prize_details"]))
            : PrizeDetails.empty(),
        extraFields: (json["extra_fields"] is List ? List<dynamic>.from(json["extra_fields"] as List) : <dynamic>[]),
        isExternalCouponPrize: readBool(json["is_external_coupon_prize"], false),
        customData: (json["custom_data"] is List ? List<dynamic>.from(json["custom_data"] as List) : <dynamic>[]),
        shipping: readBool(json["shipping"], false),
        isCustomPrize: readBool(json["is_custom_prize"], false),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "category": category,
        "description": description,
        "expiration_days": expirationDays,
        "name": name,
        "points": points,
        "prize_image_url": prizeImageUrl,
        "quantity": quantity,
        "quantity_limit_timeframe": quantityLimitTimeframe,
        "redeemable": redeemable,
        "require_redemption_token": requireRedemptionToken,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "tc": tc,
        "unlimited": unlimited,
        "use_point_type": usePointType,
        "user_limit": userLimit,
        "user_limit_timeframe": userLimitTimeframe,
        "filter": List<dynamic>.from(filter.map((x) => x)),
        "quantity_available": quantityAvailable,
        "image_url": imageUrl,
        "point_type": pointType,
        "point_type_id": pointTypeId,
        "sponsor": sponsor,
        "sponsor_id": sponsorId,
        "size": size,
        "use_codes_vault": useCodesVault,
        "available": available,
        "is_coupon_prize": isCouponPrize,
        "redeem_url": redeemUrl,
        "eid": eid,
        "addon_id": addonId,
        "metadata": metadata.toJson(),
        "prize_details": prizeDetails.toJson(),
        "extra_fields": List<dynamic>.from(extraFields.map((x) => x)),
        "is_external_coupon_prize": isExternalCouponPrize,
        "custom_data": List<dynamic>.from(customData.map((x) => x)),
        "shipping": shipping,
        "is_custom_prize": isCustomPrize,
      };
}

class MetadataReward {
  String name;
  String description;
  String termsAndConditions;
  String image;
  bool localizable;
  List<dynamic> cities;
  PrizeDetails prizeDetails;
  List<dynamic> extraFields;

  MetadataReward({
    required this.name,
    required this.description,
    required this.termsAndConditions,
    required this.image,
    required this.localizable,
    required this.cities,
    required this.prizeDetails,
    required this.extraFields,
  });

  factory MetadataReward.fromJson(Map<String, dynamic> json) => MetadataReward(
        name: readString(json["name"], ''),
        description: readString(json["description"], ''),
        termsAndConditions: readString(json["terms_and_conditions"], ''),
        image: readString(json["image"], ''),
        localizable: readBool(json["localizable"], false),
        cities: (json["cities"] is List ? List<dynamic>.from(json["cities"] as List) : <dynamic>[]),
        prizeDetails: json["prize_details"] != null
            ? PrizeDetails.fromJson(readMap(json["prize_details"]))
            : PrizeDetails.empty(),
        extraFields: (json["extra_fields"] is List ? List<dynamic>.from(json["extra_fields"] as List) : <dynamic>[]),
      );

  factory MetadataReward.empty() => MetadataReward(
        name: '',
        description: '',
        termsAndConditions: '',
        image: '',
        localizable: false,
        cities: [],
        prizeDetails: PrizeDetails.empty(),
        extraFields: [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "terms_and_conditions": termsAndConditions,
        "image": image,
        "localizable": localizable,
        "cities": List<dynamic>.from(cities.map((x) => x)),
        "prize_details": prizeDetails.toJson(),
        "extra_fields": List<dynamic>.from(extraFields.map((x) => x)),
      };
}

class PrizeDetails {
  String value;
  String description;

  PrizeDetails({
    required this.value,
    required this.description,
  });

  factory PrizeDetails.fromJson(Map<String, dynamic> json) => PrizeDetails(
        value: readString(json["value"], ''),
        description: readString(json["description"], ''),
      );

  factory PrizeDetails.empty() => PrizeDetails(value: '', description: '');

  Map<String, dynamic> toJson() => {
        "value": value,
        "description": description,
      };
}
