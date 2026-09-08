import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class ExternalDatasourceImpl extends ExternalDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  CreateActivityExternal _jsonToCreateActivityExternal(Map<String, dynamic> json) {
    final createActivityExternalResponse = CreateActivityExternalResponse.fromJson(json);
    return ExternalMapper.createActivityExternalToEntity(createActivityExternalResponse);
  }

  ExternalFormField _jsonToExternalFormField(Map<String, dynamic> json) {
    final externalFormFieldResponse = DynamicFieldsResponse.fromJson(json);
    return ExternalMapper.externalFormFieldToEntity(externalFormFieldResponse);
  }

  List<ExternalFormList> _jsonToExternalFormList(Map<String, dynamic> json) {
    final externalFormList = ExternalFormResponse.fromJson(json);
    return externalFormList.data.externals.map(ExternalMapper.externalFormListToEntity).toList();
  }

  @override
  Future<CreateActivityExternal> createActivityExternal({
    required String distinctId,
    required String event,
    String? category,
    required Map<String, dynamic> properties,
  }) async {
    final response = await dio.post(
      '/events',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'event': event,
        'distinct_id': distinctId,
        if (category != null) 'category': category,
        'properties': properties,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToCreateActivityExternal(responseData);
  }

  @override
  Future<ExternalFormField> getExternalFormField({
    required String token,
    required String externalActionId,
  }) async {
    final response = await dio.post(
      '/external_forms/actions/fields_info',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'external_action_id': externalActionId,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToExternalFormField(responseData);
  }

  @override
  Future<List<ExternalFormList>> getExternalFormListByCategory({
    required String token,
    required String category,
    String? limit,
    String? page,
    bool? participantMatchRules,
  }) async {
    final data = {
      'category': category,
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
    };
    if (limit != null) data['limit'] = limit;
    if (page != null) data['page'] = page;
    if (participantMatchRules != null) {
      data['participant_match_rules'] = participantMatchRules.toString();
    }

    final response = await dio.post(
      '/external_forms/actions/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: data,
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToExternalFormList(responseData);
  }

  @override
  Future<ExternalFormActivity> getExternalFormInfo({
    required String token,
    required String externalFormId,
  }) async {
    final response = await dio.post(
      '/external_forms/info',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'external_form_id': externalFormId,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ExternalMapper.externalFormInfoToEntity(
      ExternalFormInfoResponse.fromJson(responseData),
    );
  }

  @override
  Future<ExternalFormActivityList> getExternalFormList({
    required String token,
    int? skip,
    int? limit,
  }) async {
    final response = await dio.post(
      '/external_forms/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        if (skip != null) 'skip': skip,
        if (limit != null) 'limit': limit,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ExternalMapper.externalFormActivityListToEntity(
      ExternalFormActivityListResponse.fromJson(responseData),
    );
  }

  @override
  Future<ExternalFormActionResult> fillupExternalForm({
    required String token,
    required String externalActionId,
    String? category,
    required Map<String, dynamic> externalForm,
  }) async {
    final response = await dio.post(
      '/external_forms/actions/fillup',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'external_action_id': externalActionId,
        if (category != null) 'category': category,
        'external_form': externalForm,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ExternalMapper.externalFormActionResultToEntity(
      ExternalFormActionResultResponse.fromJson(responseData),
    );
  }

  @override
  Future<ExternalFormActionResult> updateExternalForm({
    required String token,
    required String externalFormId,
    required Map<String, dynamic> externalForm,
  }) async {
    final response = await dio.patch(
      '/external_forms',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'external_form_id': externalFormId,
        'external_form': externalForm,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ExternalMapper.externalFormActionResultToEntity(
      ExternalFormActionResultResponse.fromJson(responseData),
    );
  }
}
