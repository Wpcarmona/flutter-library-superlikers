import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class UploadPhotoMapper {
  static domain.UploadPhoto uploadPhotoToEntity(infra.UploadPhotoResponse response) {
    return domain.UploadPhoto(
      ok: response.ok,
      imageUrl: response.imageUrl,
      message: response.message,
    );
  }
}
