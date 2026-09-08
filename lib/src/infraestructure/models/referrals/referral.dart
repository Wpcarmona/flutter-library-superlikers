import '../participant/participant.dart';

class ReferralCodeResponse {
  String ok;
  String code;

  ReferralCodeResponse({required this.ok, required this.code});

  factory ReferralCodeResponse.fromJson(Map<String, dynamic> json) => ReferralCodeResponse(
        ok: json["ok"]?.toString() ?? 'true',
        code: json["code"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"ok": ok, "code": code};
}

class ParticipantReferralsResponse {
  String ok;
  int page;
  int pageSize;
  int totalPages;
  int totalData;
  List<ReferralModel> data;

  ParticipantReferralsResponse({
    required this.ok,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.data,
  });

  factory ParticipantReferralsResponse.fromJson(Map<String, dynamic> json) =>
      ParticipantReferralsResponse(
        ok: json["ok"]?.toString() ?? 'true',
        page: json["page"] ?? 1,
        pageSize: json["page_size"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        totalData: json["total_data"] ?? 0,
        data: json["data"] != null
            ? List<ReferralModel>.from(json["data"].map((x) => ReferralModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_data": totalData,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class ReferralModel {
  String code;
  Participant owner;
  String referredCode;
  String referredUid;

  ReferralModel({
    required this.code,
    required this.owner,
    required this.referredCode,
    required this.referredUid,
  });

  factory ReferralModel.fromJson(Map<String, dynamic> json) => ReferralModel(
        code: json["code"] ?? '',
        owner: Participant.fromJson(json["owner"]),
        referredCode: json["referred_code"] ?? '',
        referredUid: json["referred_uid"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "owner": owner.toJson(),
        "referred_code": referredCode,
        "referred_uid": referredUid,
      };
}
