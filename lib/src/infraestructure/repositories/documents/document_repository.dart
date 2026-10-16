import 'dart:io';

import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class DocumentRepositoryImpl extends DocumentRepository {
  final DocumentDatasource datasource;

  DocumentRepositoryImpl([DocumentDatasource? datasource])
      : datasource = datasource ?? DocumentDatasourceImpl();

  @override
  Future<UploadDocument> uploadDocument({
    required String token,
    required String distinctId,
    required File document,
    String? documentName,
    String? title,
    String? category,
  }) {
    return datasource.uploadDocument(
      token: token,
      distinctId: distinctId,
      document: document,
      documentName: documentName,
      title: title,
      category: category,
    );
  }
}
