import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class RankingRepositoryImpl extends RankingRepository {
  final RankingDatasource datasource;

  RankingRepositoryImpl([RankingDatasource? datasource])
      : datasource = datasource ?? RankingDatasourceImpl();

  @override
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
  }) {
    return datasource.getAvancedRangking(
      distinctId: distinctId,
      categories: categories,
      exactCategories: exactCategories,
      sector: sector,
      sectorB: sectorB,
      sectorC: sectorC,
      activityType: activityType,
      pointType: pointType,
      startingPoints: startingPoints,
      limitPoints: limitPoints,
      rankingSize: rankingSize,
      page: page,
      perPage: perPage,
      includeLoggedParticipant: includeLoggedParticipant,
    );
  }

  @override
  Future<List<RankingSegment>> getRankingSegment({
    List<String>? categories,
    String? pointType,
  }) {
    return datasource.getRankingSegment(categories: categories, pointType: pointType);
  }

  @override
  Future<PointsInPeriod> getPointsInPeriod({
    required String distinctId,
    required String startDate,
    required String endDate,
  }) {
    return datasource.getPointsInPeriod(
      distinctId: distinctId,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
