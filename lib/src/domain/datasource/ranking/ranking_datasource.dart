import '../../entities/entities.dart';

abstract class RankingDatasource {
  Future<List<AdvancedRanking>> getAvancedRangking({
    required String distinctId,
    List<String>? categories,
    bool? exactCategories,
    String? sector,
    String? sectorB,
    String? sectorC,
    String? activityType,
    String? pointType,
    num? startingPoints,
    num? limitPoints,
    num? rankingSize,
    num? page,
    num? perPage,
    bool? includeLoggedParticipant,
  });

  /// Ranking agrupado por segmento (combinación de tags de participante),
  /// en vez de un ranking individual por participante.
  Future<List<RankingSegment>> getRankingSegment({
    List<String>? categories,
    String? pointType,
  });

  /// Puntos ganados por un participante en un rango de fechas.
  Future<PointsInPeriod> getPointsInPeriod({
    required String distinctId,
    required String startDate,
    required String endDate,
  });
}
