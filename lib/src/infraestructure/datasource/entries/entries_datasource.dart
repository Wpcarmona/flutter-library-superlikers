import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class EntriesDatasourceImpl extends EntriesDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  ListEntries _jsonToListEntries(Map<String, dynamic> json) {
    final entriesResponse = EntriesResponseApi.fromJson(json);
    return EntriesMapper.listEntriesToEntity(entriesResponse);
  }

  @override
  Future<ListEntries> getListEntries({
    String? token,
    String? category,
    String? moderation,
    String? type,
    String? atype,
    String? after,
    String? before,
    bool? offetPaginated,
    num? page,
    num? limit,
    String? distinctId,
    bool? hideUndo,
    required Map<String, dynamic> dateFilter,
    String? view,
    String? order,
  }) async {
    final data = <String, dynamic>{
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'date_filter': dateFilter,
      if (category != null) 'category': category,
      if (moderation != null) 'moderation': moderation,
      if (type != null) '_type': type,
      if (atype != null) 'atype': atype,
      if (after != null) 'after': after,
      if (before != null) 'before': before,
      if (offetPaginated != null) 'offset_paginated': offetPaginated,
      if (page != null) 'page': page,
      if (limit != null) 'limit': limit,
      if (distinctId != null) 'distinct_id': distinctId,
      if (hideUndo != null) 'hide_undo': hideUndo,
      if (view != null) 'view': view,
      if (order != null) 'order': order,
    };

    final response = await dio.post(
      '/entries/index',
      data: data,
      options: token != null ? Options(headers: {'Authorization': 'Bearer $token'}) : null,
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);

    return _jsonToListEntries(responseData);
  }
}
