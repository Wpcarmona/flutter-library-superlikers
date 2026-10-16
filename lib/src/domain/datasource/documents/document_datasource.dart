import 'dart:io';

import '../../entities/entities.dart';

/// `POST /microsite/documents`. Sube [document] (multipart,
/// `upload_document`) y genera una actividad UploadDocument del participante.
/// Solo acepta las extensiones de [UploadDocument.allowedExtensions]; si no,
/// lanza `ArgumentError` sin llamar a la API. [title] y [category] son de la
/// actividad.
abstract class DocumentDatasource {
  Future<UploadDocument> uploadDocument({
    required String token,
    required String distinctId,
    required File document,
    String? documentName,
    String? title,
    String? category,
  });
}
