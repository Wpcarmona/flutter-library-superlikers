class GoalStatusInfoResponse {
  String ok;
  GoalStatusInfoObject object;

  GoalStatusInfoResponse({required this.ok, required this.object});

  factory GoalStatusInfoResponse.fromJson(Map<String, dynamic> json) => GoalStatusInfoResponse(
        ok: json["ok"]?.toString() ?? 'true',
        object: GoalStatusInfoObject.fromJson(json["object"]),
      );

  Map<String, dynamic> toJson() => {"ok": ok, "object": object.toJson()};
}

class GoalStatusInfoObject {
  String name;
  String status;
  int winned;
  List<String> winningDates;
  String goalId;

  GoalStatusInfoObject({
    required this.name,
    required this.status,
    required this.winned,
    required this.winningDates,
    required this.goalId,
  });

  factory GoalStatusInfoObject.fromJson(Map<String, dynamic> json) => GoalStatusInfoObject(
        name: json["name"] ?? '',
        status: json["status"]?.toString() ?? '',
        winned: json["winned"] ?? 0,
        winningDates: json["winning_dates"] != null
            ? List<String>.from(json["winning_dates"].map((x) => x.toString()))
            : [],
        goalId: json["goal_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "winned": winned,
        "winning_dates": winningDates,
        "goal_id": goalId,
      };
}
