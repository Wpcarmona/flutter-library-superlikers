import '../../entities/entities.dart';

abstract class AchievementDatasource {
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
  });
}
