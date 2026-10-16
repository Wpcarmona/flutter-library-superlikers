import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class DocumentDatasourceImpl extends DocumentDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  @override
  Future<UploadDocument> uploadDocument({
    required String token,
    required String distinctId,
    required File document,
    String? documentName,
    String? title,
    String? category,
  }) async {
    if (!UploadDocument.isAllowed(document.path)) {
      throw ArgumentError.value(
        document.path,
        'document',
        'Formato no permitido. Usa: ${UploadDocument.allowedExtensions.join(', ')}',
      );
    }
    final response = await dio.post(
      '/microsite/documents',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: FormData.fromMap({
        'document_name': ?documentName,
        'campaign': Environment.campaign,
        'api_key': Environment.apiKey,
        'distinct_id': distinctId,
        'title': ?title,
        'category': ?category,
        'upload_document': await MultipartFile.fromFile(
          document.path,
          filename: document.path.split('/').last,
        ),
      }),
    );
    final raw = response.data;
    final Map<String, dynamic> responseData =
        raw is String ? json.decode(raw) : Map<String, dynamic>.from(raw as Map);
    return DocumentMapper.uploadDocumentToEntity(UploadDocumentResponse.fromJson(responseData));
  }
}
