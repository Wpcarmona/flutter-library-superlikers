class RedeemedPrize {
  final String prizeId;
  final String prizeName;
  final String description;
  final List<String> tags;
  final int coins;
  final DateTime? redeemedAt;
  final String redemptionState;
  final String redemptionCode;
  final RedeemedPrizeUser user;
  final bool matchedInCatalog;

  RedeemedPrize({
    required this.prizeId,
    required this.prizeName,
    required this.description,
    required this.tags,
    required this.coins,
    required this.redeemedAt,
    required this.redemptionState,
    required this.redemptionCode,
    required this.user,
    required this.matchedInCatalog,
  });
}

class RedeemedPrizeUser {
  final String name;
  final String uid;
  final String email;

  RedeemedPrizeUser({
    required this.name,
    required this.uid,
    required this.email,
  });
}
