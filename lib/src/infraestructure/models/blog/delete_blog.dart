import 'dart:convert';

DeleteResponse deleteResponseFromJson(String str) => DeleteResponse.fromJson(json.decode(str));

String deleteResponseToJson(DeleteResponse data) => json.encode(data.toJson());

class DeleteResponse {
    String ok;
    String activityState;
    String activityPoints;
    String message;

    DeleteResponse({
        required this.ok,
        required this.activityState,
        required this.activityPoints,
        required this.message,
    });

    factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
        ok: json["ok"],
        activityState: json["activity_state"],
        activityPoints: json["activity_points"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "activity_state": activityState,
        "activity_points": activityPoints,
        "message": message,
    };
}
