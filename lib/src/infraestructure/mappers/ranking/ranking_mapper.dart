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
      pointsByPtype: {
        for (final entry in item.rawPointsByPtype.entries)
          entry.key: infra.rankingInt(entry.value),
      },
      colour: item.colour,
      ranking: item.ranking,
      // Campos tipados (con sus valores por defecto) + todo lo que el
      // backend haya mandado para el schema de esta campaign.
      data: {...item.data.toJson(), ...item.rawData},
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
