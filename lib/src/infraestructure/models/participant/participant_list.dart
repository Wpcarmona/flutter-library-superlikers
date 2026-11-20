import 'participant.dart';

class ParticipantListResponse {
  String ok;
  List<Participant> data;

  ParticipantListResponse({required this.ok, required this.data});

  factory ParticipantListResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantListResponse(
        ok: json["ok"]?.toString() ?? 'true',
        data: json["data"] != null
            ? [for (final x in (json["data"] is List ? json["data"] as List : const [])) if (x is Map) Participant.fromJson(Map<String, dynamic>.from(x))]
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.map((x) => x.toJson()).toList(),
      };
}
