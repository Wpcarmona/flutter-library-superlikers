import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class UploadPhotoDatasourceImpl extends UploadPhotoDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  UploadPhoto _jsonToUploadPhoto(Map<String, dynamic> json) {
    final uploadPhotoResponse = UploadPhotoResponse.fromJson(json);
    return UploadPhotoMapper.uploadPhotoToEntity(uploadPhotoResponse);
  }

  @override
  Future<UploadPhoto> uploadPhoto({
    required String distinctId,
    File? photo,
    String? imageUrl,
    String? imageName,
    String? title,
    String? category,
  }) async {
    if (photo == null && (imageUrl == null || imageUrl.isEmpty)) {
      throw ArgumentError('uploadPhoto requiere `photo` o `imageUrl`.');
    }
    if (photo != null && !UploadPhoto.isAllowed(photo.path)) {
      throw ArgumentError.value(
        photo.path,
        'photo',
        'Formato no permitido. Usa: ${UploadPhoto.allowedExtensions.join(', ')}',
      );
    }
    final response = await dio.post(
      '/photos',
      data: FormData.fromMap({
        'campaign': Environment.campaign,
        'api_key': Environment.apiKey,
        'distinct_id': distinctId,
        if (photo == null) 'image_url': imageUrl,
        'image_name': ?imageName,
        'title': ?title,
        'category': ?category,
        if (photo != null)
          'upload_photo': await MultipartFile.fromFile(
            photo.path,
            filename: photo.path.split('/').last,
          ),
      }),
    );
    final raw = response.data;
    final Map<String, dynamic> responseData =
        raw is String ? json.decode(raw) : Map<String, dynamic>.from(raw as Map);
    return _jsonToUploadPhoto(responseData);
  }
}
