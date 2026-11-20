import '../../entities/entities.dart';

abstract class ExternalDatasource {
  Future<List<ExternalFormList>> getExternalFormListByCategory({
    required String token,
    required String category,
    String? page,
    String? limit,
    bool? participantMatchRules,
  });

  Future<ExternalFormField> getExternalFormField({
    required String token,
    required String externalActionId,
  });

  /// Igual que [getExternalFormField], pero identifica la external action
  /// por su `slug` (el que se configura en el administrador) en vez de por
  /// su id.
  Future<ExternalFormField> getExternalFormFieldBySlug({
    required String token,
    required String slug,
  });

  Future<CreateActivityExternal> createActivityExternal({
    required String distinctId,
    required String event,
    String? category,
    required Map<String, dynamic> properties,
  });

  Future<ExternalFormActivity> getExternalFormInfo({
    required String token,
    required String externalFormId,
  });

  Future<ExternalFormActivityList> getExternalFormList({
    required String token,
    int? skip,
    int? limit,
  });

  /// Llena (crea) un external form a partir de una external action ya
  /// existente (ej. `external_action_id` obtenido de
  /// [getExternalFormListByCategory]).
  Future<ExternalFormActionResult> fillupExternalForm({
    required String token,
    required String externalActionId,
    String? category,
    required Map<String, dynamic> externalForm,
  });

  Future<ExternalFormActionResult> updateExternalForm({
    required String token,
    required String externalFormId,
    required Map<String, dynamic> externalForm,
  });
}
