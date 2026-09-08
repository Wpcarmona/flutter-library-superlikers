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
        ok: json["ok"],
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalData: json["total_data"],
        object: List<ObjectReward>.from(json["object"].map((x) => ObjectReward.fromJson(x))),
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
        id: json["_id"] ?? '',
        type: json["_type"] ?? '',
        category: json["category"] ?? '',
        description: json["description"] ?? '',
        expirationDays: json["expiration_days"] ?? 0,
        name: json["name"] ?? '',
        points: json["points"] ?? 0,
        prizeImageUrl: json["prize_image_url"] ?? '',
        quantity: json["quantity"] ?? 0,
        quantityLimitTimeframe: json["quantity_limit_timeframe"],
        redeemable: json["redeemable"] ?? false,
        requireRedemptionToken: json["require_redemption_token"] ?? false,
        tags: List<String>.from((json["tags"] ?? []).map((x) => x)),
        tc: json["tc"] ?? '',
        unlimited: json["unlimited"] ?? false,
        usePointType: json["use_point_type"] ?? false,
        userLimit: json["user_limit"] ?? 0,
        userLimitTimeframe: json["user_limit_timeframe"] ?? '',
        filter: List<dynamic>.from((json["filter"] ?? []).map((x) => x)),
        quantityAvailable: json["quantity_available"] ?? 0,
        imageUrl: json["image_url"] ?? json["prize_image_url"] ?? '',
        pointType: json["point_type"],
        pointTypeId: json["point_type_id"],
        sponsor: json["sponsor"],
        sponsorId: json["sponsor_id"],
        size: json["size"] ?? 0,
        useCodesVault: json["use_codes_vault"] ?? false,
        available: json["available"] ?? true,
        isCouponPrize: json["is_coupon_prize"] ?? false,
        redeemUrl: json["redeem_url"] ?? '',
        eid: json["eid"] ?? '',
        addonId: json["addon_id"] ?? '',
        metadata: json["metadata"] != null
            ? MetadataReward.fromJson(json["metadata"])
            : MetadataReward.empty(),
        prizeDetails: json["prize_details"] != null
            ? PrizeDetails.fromJson(json["prize_details"])
            : PrizeDetails.empty(),
        extraFields: List<dynamic>.from((json["extra_fields"] ?? []).map((x) => x)),
        isExternalCouponPrize: json["is_external_coupon_prize"] ?? false,
        customData: List<dynamic>.from((json["custom_data"] ?? []).map((x) => x)),
        shipping: json["shipping"] ?? false,
        isCustomPrize: json["is_custom_prize"] ?? false,
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
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        termsAndConditions: json["terms_and_conditions"] ?? '',
        image: json["image"] ?? '',
        localizable: json["localizable"] ?? false,
        cities: List<dynamic>.from((json["cities"] ?? []).map((x) => x)),
        prizeDetails: json["prize_details"] != null
            ? PrizeDetails.fromJson(json["prize_details"])
            : PrizeDetails.empty(),
        extraFields: List<dynamic>.from((json["extra_fields"] ?? []).map((x) => x)),
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
        value: json["value"] ?? '',
        description: json["description"] ?? '',
      );

  factory PrizeDetails.empty() => PrizeDetails(value: '', description: '');

  Map<String, dynamic> toJson() => {
        "value": value,
        "description": description,
      };
}
