class ListMetrics {
  final String ok;
  final List<DataListMetrics> data;

  ListMetrics({required this.ok, required this.data});
}

class DataListMetrics {
  final String id;
  final String name;
  final String description;
  final String coll;
  final String targetProperty;
  final String analysisType;
  final List<FilterListMetrics> filters;
  final bool useGoal;
  final Map<String, dynamic> goalRelatedInfo;
  final String slug;

  DataListMetrics({
    required this.id,
    required this.name,
    required this.description,
    required this.coll,
    required this.targetProperty,
    required this.analysisType,
    required this.filters,
    required this.useGoal,
    required this.goalRelatedInfo,
    required this.slug,
  });
}

class FilterListMetrics {
  final String id;
  final String field;
  final String metricOperator;
  final dynamic val;

  FilterListMetrics({
    required this.id,
    required this.field,
    required this.metricOperator,
    required this.val,
  });
}
