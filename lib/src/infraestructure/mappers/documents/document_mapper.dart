import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class DocumentMapper {
  static domain.UploadDocument uploadDocumentToEntity(infra.UploadDocumentResponse response) {
    return domain.UploadDocument(ok: response.ok, message: response.message);
  }
}
