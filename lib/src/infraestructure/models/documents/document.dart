class UploadDocumentResponse {
  String ok;
  String message;

  UploadDocumentResponse({required this.ok, required this.message});

  factory UploadDocumentResponse.fromJson(Map<String, dynamic> json) => UploadDocumentResponse(
        ok: json["ok"]?.toString() ?? 'true',
        message: json["message"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
