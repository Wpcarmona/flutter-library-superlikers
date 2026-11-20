class IndexGoals {
  /// JSON original del ítem tal como lo devolvió el backend. Su contenido
  /// depende de la campaign (campos propios, configuración, metadatos del
  /// proveedor…), así que se conserva completo para que cada app lea lo suyo.
  final Map<String, dynamic> raw;

  final String id;
  final num activityTime;
  final num acceptancesCount;
  final String brandId;
  final String campaignId;
  final bool delete;
  final String description;
  final bool enabled;
  final String formula;
  final String image;
  final String name;
  final List<String> tags;
  final String sponsorName;
  final DateTime createAt;
  final DateTime endsAt;
  final String rewardName;
  final num globalLimit;
  final num globalAwardedCount;
  final num participantMetricValue;
  final String status;
  final Map<String, dynamic> goalData;

  IndexGoals({
    this.raw = const {},
    required this.id,
    required this.acceptancesCount,
    required this.activityTime,
    required this.brandId,
    required this.campaignId,
    required this.delete,
    required this.description,
    required this.enabled,
    required this.formula,
    required this.image,
    required this.name,
    required this.tags,
    required this.sponsorName,
    required this.createAt,
    required this.endsAt,
    required this.rewardName,
    required this.globalLimit,
    required this.globalAwardedCount,
    required this.participantMetricValue,
    required this.status,
    this.goalData = const {},
  });
}
