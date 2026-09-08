import 'dart:io';

import '../../entities/entities.dart';

abstract class DocumentRepository {
  Future<UploadDocument> uploadDocument({
    required String token,
    required String distinctId,
    required File document,
    String? documentName,
  });
}
