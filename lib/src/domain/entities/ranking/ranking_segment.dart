class RankingSegment {
  final int participants;
  final DateTime latestCreatedAt;
  final DateTime oldestLastPointsReceivedAt;
  final num rankingPoints;
  final List<String> segment;
  final int ranking;

  RankingSegment({
    required this.participants,
    required this.latestCreatedAt,
    required this.oldestLastPointsReceivedAt,
    required this.rankingPoints,
    required this.segment,
    required this.ranking,
  });
}
