import 'participant.dart';

class ParticipantListResponse {
  String ok;
  List<Participant> data;

  ParticipantListResponse({required this.ok, required this.data});

  factory ParticipantListResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantListResponse(
        ok: json["ok"]?.toString() ?? 'true',
        data: json["data"] != null
            ? List<Participant>.from(json["data"].map((x) => Participant.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": data.map((x) => x.toJson()).toList(),
      };
}
