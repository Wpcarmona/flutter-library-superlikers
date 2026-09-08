class RewardRedeemResponse {
  String ok;
  ObjectRewardRedeem object;

  RewardRedeemResponse({
    required this.ok,
    required this.object,
  });

  factory RewardRedeemResponse.fromJson(Map<String, dynamic> json) => RewardRedeemResponse(
        ok: json["ok"],
        object: ObjectRewardRedeem.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "object": object.toJson(),
      };
}

class ObjectRewardRedeem {
  int points;
  Reward reward;
  Redemption redemption;
  String message;

  ObjectRewardRedeem({
    required this.points,
    required this.reward,
    required this.redemption,
    required this.message,
  });

  factory ObjectRewardRedeem.fromJson(Map<String, dynamic> json) => ObjectRewardRedeem(
        points: json["points"],
        reward: Reward.fromJson(json["reward"]),
        redemption: Redemption.fromJson(json["redemption"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
        "reward": reward.toJson(),
        "redemption": redemption.toJson(),
        "message": message,
      };
}

class Redemption {
  String id;
  String redeemId;
  String prizeName;
  String imageUrl;
  int createdAt;
  int updatedAt;
  int points;
  dynamic pointType;
  String state;
  CustomData customData;
  bool isRedemptionCustomPrize;
  String prizeDescription;

  Redemption({
    required this.id,
    required this.redeemId,
    required this.prizeName,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.points,
    required this.pointType,
    required this.state,
    required this.customData,
    required this.isRedemptionCustomPrize,
    required this.prizeDescription,
  });

  factory Redemption.fromJson(Map<String, dynamic> json) => Redemption(
        id: json["_id"],
        redeemId: json["redeem_id"],
        prizeName: json["prize_name"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        points: json["points"],
        pointType: json["point_type"],
        state: json["state"],
        customData: CustomData.fromJson(json["custom_data"]),
        isRedemptionCustomPrize: json["is_redemption_custom_prize"],
        prizeDescription: json["prize_description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "redeem_id": redeemId,
        "prize_name": prizeName,
        "image_url": imageUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "points": points,
        "point_type": pointType,
        "state": state,
        "custom_data": customData.toJson(),
        "is_redemption_custom_prize": isRedemptionCustomPrize,
        "prize_description": prizeDescription,
      };
}

class CustomData {
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String correo;
  String telefono;
  String calle;
  String noExt;
  String noInt;
  String colonia;
  String municipio;
  String estado;
  String cp;
  String referencia;
  String entreCalles;

  CustomData({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.telefono,
    required this.calle,
    required this.noExt,
    required this.noInt,
    required this.colonia,
    required this.municipio,
    required this.estado,
    required this.cp,
    required this.referencia,
    required this.entreCalles,
  });

  factory CustomData.fromJson(Map<String, dynamic> json) => CustomData(
        nombre: json["nombre"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        correo: json["correo"],
        telefono: json["telefono"],
        calle: json["calle"],
        noExt: json["noExt"],
        noInt: json["noInt"],
        colonia: json["colonia"],
        municipio: json["municipio"],
        estado: json["estado"],
        cp: json["cp"],
        referencia: json["referencia"],
        entreCalles: json["entreCalles"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "correo": correo,
        "telefono": telefono,
        "calle": calle,
        "noExt": noExt,
        "noInt": noInt,
        "colonia": colonia,
        "municipio": municipio,
        "estado": estado,
        "cp": cp,
        "referencia": referencia,
        "entreCalles": entreCalles,
      };
}

class Reward {
  String id;
  String type;
  String description;
  int expirationDays;
  String name;
  int points;
  int quantity;
  bool redeemable;
  List<dynamic> tags;
  String tc;
  bool unlimited;
  bool usePointType;
  int userLimit;
  String userLimitTimeframe;
  List<dynamic> filter;
  int quantityAvailable;
  dynamic imageUrl;
  dynamic pointType;
  String pointTypeId;
  List<dynamic> customData;
  String eid;
  String addonId;
  Metadata metadata;
  bool shipping;
  bool available;
  bool isCustomPrize;
  String redeemUrl;

  Reward({
    required this.id,
    required this.type,
    required this.description,
    required this.expirationDays,
    required this.name,
    required this.points,
    required this.quantity,
    required this.redeemable,
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
    required this.customData,
    required this.eid,
    required this.addonId,
    required this.metadata,
    required this.shipping,
    required this.available,
    required this.isCustomPrize,
    required this.redeemUrl,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        id: json["_id"],
        type: json["_type"],
        description: json["description"],
        expirationDays: json["expiration_days"],
        name: json["name"],
        points: json["points"],
        quantity: json["quantity"],
        redeemable: json["redeemable"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        tc: json["tc"],
        unlimited: json["unlimited"],
        usePointType: json["use_point_type"],
        userLimit: json["user_limit"],
        userLimitTimeframe: json["user_limit_timeframe"],
        filter: List<dynamic>.from(json["filter"].map((x) => x)),
        quantityAvailable: json["quantity_available"],
        imageUrl: json["image_url"],
        pointType: json["point_type"],
        pointTypeId: json["point_type_id"],
        customData: List<dynamic>.from(json["custom_data"].map((x) => x)),
        eid: json["eid"],
        addonId: json["addon_id"],
        metadata: Metadata.fromJson(json["metadata"]),
        shipping: json["shipping"],
        available: json["available"],
        isCustomPrize: json["is_custom_prize"],
        redeemUrl: json["redeem_url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_type": type,
        "description": description,
        "expiration_days": expirationDays,
        "name": name,
        "points": points,
        "quantity": quantity,
        "redeemable": redeemable,
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
        "custom_data": List<dynamic>.from(customData.map((x) => x)),
        "eid": eid,
        "addon_id": addonId,
        "metadata": metadata.toJson(),
        "shipping": shipping,
        "available": available,
        "is_custom_prize": isCustomPrize,
        "redeem_url": redeemUrl,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}
