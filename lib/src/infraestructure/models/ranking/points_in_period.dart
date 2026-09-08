class PointsInPeriodResponse {
  String ok;
  PointsInPeriodObject object;

  PointsInPeriodResponse({required this.ok, required this.object});

  factory PointsInPeriodResponse.fromJson(Map<String, dynamic> json) => PointsInPeriodResponse(
        ok: json["ok"]?.toString() ?? 'true',
        object: PointsInPeriodObject.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "object": object.toJson()};
}

class PointsInPeriodObject {
  DateTime startDate;
  DateTime endDate;
  String? pointTypeId;
  num points;

  PointsInPeriodObject({
    required this.startDate,
    required this.endDate,
    this.pointTypeId,
    required this.points,
  });

  factory PointsInPeriodObject.fromJson(Map<String, dynamic> json) => PointsInPeriodObject(
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        pointTypeId: json["point_type_id"],
        points: json["points"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "point_type_id": pointTypeId,
        "points": points,
      };
}
