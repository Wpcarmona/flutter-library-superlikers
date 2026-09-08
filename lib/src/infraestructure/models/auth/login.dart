import '../participant/participant.dart';

class LoginResponse {
  String ok;
  String token;
  Participant participant;
  String message;

  LoginResponse({
    required this.ok,
    required this.token,
    required this.participant,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        token: json["token"],
        participant: Participant.fromJson(json["participant"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "participant": participant.toJson(),
        "message": message,
      };
}
