import '../participant/participant.dart';

class RegisterResponse {
  String ok;
  String token;
  Participant participantData;
  String message;

  RegisterResponse({
    required this.ok,
    required this.token,
    required this.participantData,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        ok: json["ok"],
        token: json["token"],
        participantData: Participant.fromJson(json["participant_data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "participant_data": participantData.toJson(),
        "message": message,
      };
}
