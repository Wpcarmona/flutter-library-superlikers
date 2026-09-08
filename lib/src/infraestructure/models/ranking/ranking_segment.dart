class RankingSegmentResponse {
  String ok;
  List<RankingSegmentDatum> data;

  RankingSegmentResponse({required this.ok, required this.data});

  factory RankingSegmentResponse.fromJson(Map<String, dynamic> json) => RankingSegmentResponse(
        ok: json["ok"]?.toString() ?? 'true',
        data: json["data"] != null
            ? List<RankingSegmentDatum>.from(
                json["data"].map((x) => RankingSegmentDatum.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class RankingSegmentDatum {
  int participants;
  DateTime latestCreatedAt;
  DateTime oldestLastPointsReceivedAt;
  num rankingPoints;
  List<String> segment;
  int ranking;

  RankingSegmentDatum({
    required this.participants,
    required this.latestCreatedAt,
    required this.oldestLastPointsReceivedAt,
    required this.rankingPoints,
    required this.segment,
    required this.ranking,
  });

  factory RankingSegmentDatum.fromJson(Map<String, dynamic> json) => RankingSegmentDatum(
        participants: json["participants"] ?? 0,
        latestCreatedAt: DateTime.parse(json["latest_created_at"]),
        oldestLastPointsReceivedAt: DateTime.parse(json["oldest_last_points_received_at"]),
        rankingPoints: json["ranking_points"] ?? 0,
        segment: json["segment"] != null ? List<String>.from(json["segment"]) : [],
        ranking: json["ranking"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "participants": participants,
        "latest_created_at": latestCreatedAt.toIso8601String(),
        "oldest_last_points_received_at": oldestLastPointsReceivedAt.toIso8601String(),
        "ranking_points": rankingPoints,
        "segment": segment,
        "ranking": ranking,
      };
}
