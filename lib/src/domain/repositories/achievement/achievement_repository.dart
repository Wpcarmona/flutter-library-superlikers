import '../../entities/entities.dart';

abstract class AchievementRepository {
  Future<List<Achievements>> getAchievement({
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
