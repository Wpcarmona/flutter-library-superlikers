class DeleteCommentResponse {
  String ok;
  String activityState;
  dynamic activityPoints;
  String message;

  DeleteCommentResponse({
    required this.ok,
    required this.activityState,
    required this.activityPoints,
    required this.message,
  });

  factory DeleteCommentResponse.fromJson(Map<String, dynamic> json) => DeleteCommentResponse(
        ok: json["ok"]?.toString() ?? 'true',
        activityState: json["activity_state"]?.toString() ?? '',
        activityPoints: json["activity_points"],
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "activity_state": activityState,
        "activity_points": activityPoints,
        "message": message,
      };
}
