import 'dart:io';

import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class UploadPhotoRepositoryImpl extends UploadPhotoRepository {
  final UploadPhotoDatasource datasource;

  UploadPhotoRepositoryImpl([UploadPhotoDatasource? datasource])
      : datasource = datasource ?? UploadPhotoDatasourceImpl();

  @override
  Future<UploadPhoto> uploadPhoto({
    required String distinctId,
    required File photo,
    String? imageName,
  }) {
    return datasource.uploadPhoto(distinctId: distinctId, photo: photo, imageName: imageName);
  }
}
