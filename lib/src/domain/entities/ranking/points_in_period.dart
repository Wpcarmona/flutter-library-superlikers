class PointsInPeriod {
  final String ok;
  final DateTime startDate;
  final DateTime endDate;
  final String? pointTypeId;
  final num points;

  PointsInPeriod({
    required this.ok,
    required this.startDate,
    required this.endDate,
    this.pointTypeId,
    required this.points,
  });
}
