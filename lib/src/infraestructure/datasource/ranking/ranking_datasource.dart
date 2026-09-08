import 'dart:convert';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class RankingDatasourceImpl extends RankingDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  List<AdvancedRanking> _jsonToAdvancedRankingList(Map<String, dynamic> json) {
    final advancedRankingResponse = AdvancedRankingResponse.fromJson(json);
    return RankingMapper.toEntityList(advancedRankingResponse);
  }

  @override
  Future<List<AdvancedRanking>> getAvancedRangking({
    required String distinctId,
    List<String>? categories,
    bool? exactCategories,
    String? sector,
    String? sectorB,
    String? sectorC,
    String? activityType,
    String? pointType,
    num? startingPoints,
    num? limitPoints,
    num? rankingSize,
    num? page,
    num? perPage,
    bool? includeLoggedParticipant,
  }) async {
    final body = <String, dynamic>{
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'distinct_id': distinctId,
    };

    if (categories != null && categories.isNotEmpty) {
      body['categories'] = categories;
    }
    if (exactCategories != null) body['exact_categories'] = exactCategories;
    if (activityType != null && activityType.trim().isNotEmpty) {
      body['activity_type'] = activityType;
    }
    if (pointType != null && pointType.trim().isNotEmpty) {
      body['point_type'] = pointType;
    }
    if (startingPoints != null) body['starting_points'] = startingPoints;
    if (limitPoints != null) body['limit_points'] = limitPoints;
    if (rankingSize != null) body['ranking_size'] = rankingSize;

    final queryParams = <String, dynamic>{};

    if (sector != null && sector.trim().isNotEmpty) {
      queryParams['sector'] = sector;
    }
    if (sectorB != null && sectorB.trim().isNotEmpty) {
      queryParams['sector_b'] = sectorB;
    }
    if (sectorC != null && sectorC.trim().isNotEmpty) {
      queryParams['sector_c'] = sectorC;
    }
    if (page != null) queryParams['page'] = page;
    if (perPage != null) queryParams['per_page'] = perPage;
    if (includeLoggedParticipant != null) {
      queryParams['include_logged_participant'] = includeLoggedParticipant;
    }

    final response = await dio.post(
      '/participants/ranks/advanced',
      data: body,
      queryParameters: queryParams,
    );

    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToAdvancedRankingList(responseData);
  }

  @override
  Future<List<RankingSegment>> getRankingSegment({
    List<String>? categories,
    String? pointType,
  }) async {
    final response = await dio.post(
      '/participants/ranks/segment',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        if (categories != null && categories.isNotEmpty) 'categories': categories,
        if (pointType != null && pointType.trim().isNotEmpty) 'point_type': pointType,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return RankingMapper.toSegmentList(RankingSegmentResponse.fromJson(responseData));
  }

  @override
  Future<PointsInPeriod> getPointsInPeriod({
    required String distinctId,
    required String startDate,
    required String endDate,
  }) async {
    final response = await dio.post(
      '/participants/points_in_period',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'start_date': startDate,
        'end_date': endDate,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return RankingMapper.toPointsInPeriod(PointsInPeriodResponse.fromJson(responseData));
  }
}
