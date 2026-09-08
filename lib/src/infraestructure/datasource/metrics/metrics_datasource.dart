import 'dart:convert';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class MetricsDatasourceImpl extends MetricsDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  ListMetrics _jsonToListMetrics(Map<String, dynamic> json) {
    final listMetricsResponse = ListMetricsResponse.fromJson(json);
    return MetricsMapper.listMetricsToEntity(listMetricsResponse);
  }

  CalculateMetrics _jsonToCalculateMetrics(Map<String, dynamic> json) {
    final calculateMetricsResponse = CalculateMetricsResponse.fromJson(json);
    return MetricsMapper.calculateMetricsToEntity(calculateMetricsResponse);
  }

  @override
  Future<ListMetrics> getMetrics({num? limit, num? page, String? q}) async {
    final response = await dio.post(
      '/metrics',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        if (limit != null) 'limit': limit,
        if (page != null) 'page': page,
        if (q != null) 'q': q,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToListMetrics(responseData);
  }

  @override
  Future<CalculateMetrics> calculateMetrics({
    required String distinctId,
    required String slug,
    required String timeFrame,
    String? uidType,
  }) async {
    final response = await dio.post('/metrics/exec', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'distinct_id': distinctId,
      'slug': slug,
      'timeframe': timeFrame,
      if (uidType != null) 'uid_type': uidType,
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToCalculateMetrics(responseData);
  }
}
