import '../../entities/entities.dart';

abstract class ExternalRepository {
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

  /// Atajo para cuando no hace falta decidir entre varias external actions
  /// de la misma [category]: busca la primera (vía
  /// [getExternalFormListByCategory]) y trae sus fields (vía
  /// [getExternalFormField]) en una sola llamada. Los dos métodos originales
  /// siguen disponibles tal cual para cuando sí haga falta ese control.
  ///
  /// Lanza una [Exception] si no existe ninguna external action para
  /// [category] en esta campaign.
  Future<ExternalFormField> getExternalFormFieldByCategory({
    required String token,
    required String category,
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
