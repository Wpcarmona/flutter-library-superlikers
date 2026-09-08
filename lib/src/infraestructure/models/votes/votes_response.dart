import 'dart:convert';

VotesResponse votesResponseFromJson(String str) => VotesResponse.fromJson(json.decode(str));

String votesResponseToJson(VotesResponse data) => json.encode(data.toJson());

class VotesResponse {
    String ok;
    String message;

    VotesResponse({
        required this.ok,
        required this.message,
    });

    factory VotesResponse.fromJson(Map<String, dynamic> json) => VotesResponse(
        ok: json["ok"]?.toString() ?? 'true',
        message: json["message"]?.toString() ?? '',
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
    };
}
