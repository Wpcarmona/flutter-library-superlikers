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
    File? photo,
    String? imageUrl,
    String? imageName,
    String? title,
    String? category,
  }) {
    return datasource.uploadPhoto(
      distinctId: distinctId,
      photo: photo,
      imageUrl: imageUrl,
      imageName: imageName,
      title: title,
      category: category,
    );
  }
}
