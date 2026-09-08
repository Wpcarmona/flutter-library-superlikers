import 'dart:convert';

UpdateParticipantAvatarResponse updateParticipantAvatarResponseFromJson(String str) =>
    UpdateParticipantAvatarResponse.fromJson(json.decode(str));

String updateParticipantAvatarResponseToJson(UpdateParticipantAvatarResponse data) =>
    json.encode(data.toJson());

class UpdateParticipantAvatarResponse {
  String ok;
  String message;

  UpdateParticipantAvatarResponse({
    required this.ok,
    required this.message,
  });

  factory UpdateParticipantAvatarResponse.fromJson(Map<String, dynamic> json) =>
      UpdateParticipantAvatarResponse(
        ok: json["ok"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
      };
}
