class ParticipantPoints {
  final String ok;
  final num totalPoints;
  final num points;
  final num redeemedPoints;
  final num pointsToExpire;
  final String expirationDate;
  final num expiredPoints;

  ParticipantPoints({
    required this.ok,
    required this.totalPoints,
    required this.points,
    required this.redeemedPoints,
    required this.pointsToExpire,
    required this.expirationDate,
    required this.expiredPoints,
  });
}
