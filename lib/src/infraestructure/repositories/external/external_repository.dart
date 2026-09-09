import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class ExternalRepositoryImpl extends ExternalRepository {
  final ExternalDatasource datasource;

  ExternalRepositoryImpl([ExternalDatasource? datasource])
      : datasource = datasource ?? ExternalDatasourceImpl();

  @override
  Future<CreateActivityExternal> createActivityExternal({
    required String distinctId,
    required String event,
    String? category,
    required Map<String, dynamic> properties,
  }) {
    return datasource.createActivityExternal(
      distinctId: distinctId,
      event: event,
      category: category,
      properties: properties,
    );
  }

  @override
  Future<ExternalFormField> getExternalFormField({
    required String token,
    required String externalActionId,
  }) {
    return datasource.getExternalFormField(
      token: token,
      externalActionId: externalActionId,
    );
  }

  @override
  Future<ExternalFormField> getExternalFormFieldByCategory({
    required String token,
    required String category,
  }) async {
    final list = await getExternalFormListByCategory(
      token: token,
      category: category,
      limit: '1',
    );
    if (list.isEmpty) {
      throw Exception(
        'No existe ninguna external action para la categoría "$category" en esta campaign.',
      );
    }
    return getExternalFormField(token: token, externalActionId: list.first.id);
  }

  @override
  Future<List<ExternalFormList>> getExternalFormListByCategory({
    required String token,
    required String category,
    String? page,
    String? limit,
    bool? participantMatchRules,
  }) {
    return datasource.getExternalFormListByCategory(
      token: token,
      category: category,
      page: page,
      limit: limit,
      participantMatchRules: participantMatchRules,
    );
  }

  @override
  Future<ExternalFormActivity> getExternalFormInfo({
    required String token,
    required String externalFormId,
  }) {
    return datasource.getExternalFormInfo(token: token, externalFormId: externalFormId);
  }

  @override
  Future<ExternalFormActivityList> getExternalFormList({
    required String token,
    int? skip,
    int? limit,
  }) {
    return datasource.getExternalFormList(token: token, skip: skip, limit: limit);
  }

  @override
  Future<ExternalFormActionResult> fillupExternalForm({
    required String token,
    required String externalActionId,
    String? category,
    required Map<String, dynamic> externalForm,
  }) {
    return datasource.fillupExternalForm(
      token: token,
      externalActionId: externalActionId,
      category: category,
      externalForm: externalForm,
    );
  }

  @override
  Future<ExternalFormActionResult> updateExternalForm({
    required String token,
    required String externalFormId,
    required Map<String, dynamic> externalForm,
  }) {
    return datasource.updateExternalForm(
      token: token,
      externalFormId: externalFormId,
      externalForm: externalForm,
    );
  }
}
