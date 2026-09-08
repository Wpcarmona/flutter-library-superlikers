import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class AchievementRepositoryImpl extends AchievementRepository {
  final AchievementDatasource achievementDatasource;

  AchievementRepositoryImpl([AchievementDatasource? achievementDatasource])
      : achievementDatasource =
            achievementDatasource ?? AchievementDatasourceImpl();

  @override
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
  }) async {
    final achievement = await achievementDatasource.getAchievement(
      dateFilter: dateFilter,
      type: type,
      tags: tags,
      after: after,
      before: before,
      offsetPaginated: offsetPaginated,
      page: page,
      limit: limit,
      distinctId: distinctId,
      goalId: goalId,
      order: order,
    );
    return achievement.data.achievements;
  }
}
