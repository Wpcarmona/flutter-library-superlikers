import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;
import '../participant/participant_mapper.dart';

class ExternalMapper {
  static domain.CreateActivityExternal createActivityExternalToEntity(
    infra.CreateActivityExternalResponse response,
  ) =>
      domain.CreateActivityExternal(ok: response.ok, message: response.message);

  static domain.ExternalFormField externalFormFieldToEntity(
    infra.DynamicFieldsResponse response,
  ) =>
      domain.ExternalFormField(
        id: response.data.id,
        externalAction: response.data.externalAction,
        field: response.data.fields
            .map(
              (f) => domain.FieldEntityField(
                fieldType: f.fieldType,
                typeValue: f.typeValue,
                name: f.name,
                label: f.label,
                helpText: f.helpText,
                placeholder: f.placeholder,
                defaultValue: f.defaultValue,
                requiredField: f.requiredField,
                uniqueField: f.uniqueField,
                format: f.format,
                choices: f.choices
                    ?.map((c) => domain.ChoiceField(label: c.label, value: c.value))
                    .toList(),
              ),
            )
            .toList(),
      );

  static domain.ExternalFormList externalFormListToEntity(infra.External response) =>
      domain.ExternalFormList(
        id: response.id,
        name: response.name,
        category: response.category,
        formId: response.formId,
        slug: response.slug,
      );

  static domain.ExternalFormActivity _externalFormActivityToEntity(
    infra.ExternalFormActivityModel model,
  ) =>
      domain.ExternalFormActivity(
        id: model.id,
        type: model.type,
        activityCount: model.activityCount,
        atype: model.atype,
        category: model.category,
        moderation: model.moderation,
        points: model.points,
        state: model.state,
        createdAt: model.createdAt,
        executeDate: model.executeDate,
        module: model.module,
        name: model.name,
        team: model.team,
        participant: ParticipantMapper.toEntity(model.participant),
        properties: model.properties,
      );

  static domain.ExternalFormActivity externalFormInfoToEntity(
    infra.ExternalFormInfoResponse response,
  ) =>
      _externalFormActivityToEntity(response.data);

  static domain.ExternalFormActivityList externalFormActivityListToEntity(
    infra.ExternalFormActivityListResponse response,
  ) =>
      domain.ExternalFormActivityList(
        ok: response.ok,
        page: response.page,
        pageSize: response.pageSize,
        totalPages: response.totalPages,
        totalData: response.totalData,
        forms: response.externalForms.map(_externalFormActivityToEntity).toList(),
      );

  static domain.ExternalFormActionResult externalFormActionResultToEntity(
    infra.ExternalFormActionResultResponse response,
  ) =>
      domain.ExternalFormActionResult(ok: response.ok, message: response.message);
}
