import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class MetricsMapper {
  static domain.ListMetrics listMetricsToEntity(infra.ListMetricsResponse response) {
    return domain.ListMetrics(
      ok: response.ok,
      data: response.data
          .map(
            (e) => domain.DataListMetrics(
              id: e.id,
              name: e.name,
              description: e.description,
              coll: e.coll,
              targetProperty: e.targetProperty,
              analysisType: e.analysisType,
              filters: e.filter
                  .map(
                    (f) => domain.FilterListMetrics(
                      id: f.id,
                      field: f.field,
                      metricOperator: f.filterOperator,
                      val: f.val,
                    ),
                  )
                  .toList(),
              useGoal: e.useGoals,
              goalRelatedInfo: {},
              slug: e.slug,
            ),
          )
          .toList(),
    );
  }

  static domain.CalculateMetrics calculateMetricsToEntity(
    infra.CalculateMetricsResponse response,
  ) {
    return domain.CalculateMetrics(
      ok: response.ok,
      result: response.result,
    );
  }
}
