class Reward {
  final String id;
  final String type;
  final String description;
  final int expirationDays;
  final String name;
  final int points;
  final bool redeemable;
  final List<String> tags;
  final String termsAndConditions;
  final bool unlimited;
  final String image;
  final String pointType;
  final bool avalible;
  final String redeemUrl;
  final int? localizable;
  final List<String>? customData;
  final List<String>? cities;
  final List<Brands>? brands;

  Reward({
    required this.id,
    required this.type,
    required this.description,
    required this.expirationDays,
    required this.name,
    required this.points,
    required this.redeemable,
    required this.tags,
    required this.termsAndConditions,
    required this.unlimited,
    required this.image,
    required this.pointType,
    required this.avalible,
    required this.redeemUrl,
    this.customData,
    this.brands,
    this.localizable,
    this.cities,
  });
}

class Brands {
  final int? brandId;
  final String? name;

  Brands({this.brandId, this.name});
}
