import 'dart:convert';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart' hide Achievement;

class AchievementDatasourceImpl extends AchievementDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  Achievement _jsonToAchievement(Map<String, dynamic> json) {
    final response = AchievementResponse.fromJson(json);
    return AchievementMapper.achievementToEntity(response);
  }

  @override
  Future<Achievement> getAchievement({
    required Map<String, dynamic> dateFilter,
    String? type,
    List<String>? tags,
    String? after,
    String? before,
    bool? offsetPaginated,
    num? page,
    num? limit,
    String? distinctId,
    String? goalId,
    String? order,
  }) async {
    final data = <String, dynamic>{
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'date_filter': dateFilter,
      '_type': ?type,
      'tags': ?tags,
      'after': ?after,
      'before': ?before,
      'offset_paginated': ?offsetPaginated,
      'page': ?page,
      'limit': ?limit,
      'distinct_id': ?distinctId,
      'goal_id': ?goalId,
      'order': ?order,
    };

    final response = await dio.post('/achievements/index', data: data);
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToAchievement(responseData);
  }
}
