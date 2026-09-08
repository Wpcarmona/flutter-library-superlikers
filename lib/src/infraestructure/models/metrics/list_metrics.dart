class ListMetricsResponse {
  String ok;
  List<DatumListMetrics> data;

  ListMetricsResponse({
    required this.ok,
    required this.data,
  });

  factory ListMetricsResponse.fromJson(Map<String, dynamic> json) => ListMetricsResponse(
        ok: json["ok"],
        data: List<DatumListMetrics>.from(json["data"].map((x) => DatumListMetrics.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumListMetrics {
  String id;
  String name;
  String description;
  String coll;
  String targetProperty;
  String analysisType;
  List<FilterListMetricsResponse> filter;
  bool useGoals;
  List<dynamic> goalsRelatedInfo;
  String slug;

  DatumListMetrics({
    required this.id,
    required this.name,
    required this.description,
    required this.coll,
    required this.targetProperty,
    required this.analysisType,
    required this.filter,
    required this.useGoals,
    required this.goalsRelatedInfo,
    required this.slug,
  });

  factory DatumListMetrics.fromJson(Map<String, dynamic> json) => DatumListMetrics(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        coll: json["coll"],
        targetProperty: json["target_property"],
        analysisType: json["analysis_type"],
        filter: List<FilterListMetricsResponse>.from(json["filter"].map((x) => FilterListMetricsResponse.fromJson(x))),
        useGoals: json["use_goals"],
        goalsRelatedInfo: List<dynamic>.from(json["goals_related_info"].map((x) => x)),
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "coll": coll,
        "target_property": targetProperty,
        "analysis_type": analysisType,
        "filter": List<dynamic>.from(filter.map((x) => x.toJson())),
        "use_goals": useGoals,
        "goals_related_info": List<dynamic>.from(goalsRelatedInfo.map((x) => x)),
        "slug": slug,
      };
}

class FilterListMetricsResponse {
  String id;
  String field;
  String filterOperator;
  dynamic val;

  FilterListMetricsResponse({
    required this.id,
    required this.field,
    required this.filterOperator,
    required this.val,
  });

  factory FilterListMetricsResponse.fromJson(Map<String, dynamic> json) => FilterListMetricsResponse(
        id: json["_id"],
        field: json["field"],
        filterOperator: json["operator"],
        val: json["val"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "field": field,
        "operator": filterOperator,
        "val": val,
      };
}
