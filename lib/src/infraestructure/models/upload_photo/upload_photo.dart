import 'dart:convert';

UploadPhotoResponse uploadPhotoResponseFromJson(String str) =>
    UploadPhotoResponse.fromJson(json.decode(str));

String uploadPhotoResponseToJson(UploadPhotoResponse data) => json.encode(data.toJson());

class UploadPhotoResponse {
  String ok;
  String imageUrl;
  String message;

  UploadPhotoResponse({
    required this.ok,
    required this.imageUrl,
    required this.message,
  });

  factory UploadPhotoResponse.fromJson(Map<String, dynamic> json) => UploadPhotoResponse(
        ok: json["ok"]?.toString() ?? '',
        imageUrl: json["image_url"]?.toString() ?? json["url"]?.toString() ?? '',
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "image_url": imageUrl,
        "message": message,
      };
}
