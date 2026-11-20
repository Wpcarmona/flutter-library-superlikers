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
        ok: json["ok"]?.toString() ?? '',
        token: json["token"]?.toString() ?? '',
        participant: Participant.fromJson(
          json["participant"] is Map
              ? Map<String, dynamic>.from(json["participant"])
              : const <String, dynamic>{},
        ),
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "participant": participant.toJson(),
        "message": message,
      };
}
