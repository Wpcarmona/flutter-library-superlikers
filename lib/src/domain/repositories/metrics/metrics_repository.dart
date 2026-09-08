import '../../entities/entities.dart';

abstract class MetricsRepository {
  Future<ListMetrics> getMetrics({num? limit, num? page, String? q});

  Future<CalculateMetrics> calculateMetrics({
    required String distinctId,
    required String slug,
    required String timeFrame,
    String? uidType,
  });
}
