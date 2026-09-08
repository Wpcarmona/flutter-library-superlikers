import 'dart:io';

import '../../entities/entities.dart';

abstract class UploadPhotoRepository {
  Future<UploadPhoto> uploadPhoto({
    required String distinctId,
    required File photo,
    String? imageName,
  });
}
