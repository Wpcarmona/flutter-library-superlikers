import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class MetricsRepositoryimpl extends MetricsRepository {
  final MetricsDatasource datasource;

  MetricsRepositoryimpl([MetricsDatasource? datasource])
      : datasource = datasource ?? MetricsDatasourceImpl();

  @override
  Future<ListMetrics> getMetrics({num? limit, num? page, String? q}) {
    return datasource.getMetrics(limit: limit, page: page, q: q);
  }

  @override
  Future<CalculateMetrics> calculateMetrics({
    required String distinctId,
    required String slug,
    required String timeFrame,
    String? uidType,
  }) {
    return datasource.calculateMetrics(
        distinctId: distinctId,
        slug: slug,
        timeFrame: timeFrame,
        uidType: uidType);
  }
}
