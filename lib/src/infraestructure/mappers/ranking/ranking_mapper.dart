import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class RankingMapper {
  static List<domain.AdvancedRanking> toEntityList(
    infra.AdvancedRankingResponse response,
  ) {
    return response.data.map(_mapItem).toList();
  }

  static domain.AdvancedRanking _mapItem(infra.Datum item) {
    return domain.AdvancedRanking(
      name: item.name,
      firstName: item.firstName,
      lastName: item.lastName,
      votes: item.votes,
      points: item.points,
      rankingPoints: item.rankingPoints,
      level: item.level,
      pointsByPtype: Map<String, int>.from(item.pointsByPtype.toJson()),
      colour: item.colour,
      ranking: item.ranking,
      data: item.data.toJson(),
    );
  }

  static List<domain.RankingSegment> toSegmentList(
    infra.RankingSegmentResponse response,
  ) {
    return response.data
        .map(
          (item) => domain.RankingSegment(
            participants: item.participants,
            latestCreatedAt: item.latestCreatedAt,
            oldestLastPointsReceivedAt: item.oldestLastPointsReceivedAt,
            rankingPoints: item.rankingPoints,
            segment: item.segment,
            ranking: item.ranking,
          ),
        )
        .toList();
  }

  static domain.PointsInPeriod toPointsInPeriod(
    infra.PointsInPeriodResponse response,
  ) {
    return domain.PointsInPeriod(
      ok: response.ok,
      startDate: response.object.startDate,
      endDate: response.object.endDate,
      pointTypeId: response.object.pointTypeId,
      points: response.object.points,
    );
  }
}
