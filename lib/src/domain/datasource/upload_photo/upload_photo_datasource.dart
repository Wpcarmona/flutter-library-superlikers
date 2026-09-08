import 'dart:io';

import '../../entities/entities.dart';

abstract class UploadPhotoDatasource {
  Future<UploadPhoto> uploadPhoto({
    required String distinctId,
    required File photo,
    String? imageName,
  });
}
