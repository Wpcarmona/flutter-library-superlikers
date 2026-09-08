import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class GoalRepositoryImpl extends GoalRepository {
  final GoalDatasource datasource;

  GoalRepositoryImpl([GoalDatasource? datasource])
      : datasource = datasource ?? GoalDatasourceImpl();

  @override
  Future<List<IndexGoals>> getGoalsIndex({
    required bool enabled,
    required List<String> tags,
    num? page,
    num? limit,
    String? sponsorId,
    bool? trending,
    String? q,
  }) {
    return datasource.getGoalsIndex(
      enabled: enabled,
      tags: tags,
      page: page,
      limit: limit,
      sponsorId: sponsorId,
      trending: trending,
      q: q,
    );
  }

  @override
  Future<List<GoalsParticipant>> getGoalsParticipant({
    required String token,
    required List<String> tags,
    required String distictId,
    int page = 1,
  }) {
    return datasource.getGoalsParticipant(
        token: token, distictId: distictId, tags: tags, page: page);
  }

  @override
  Future<AcceptGoals> acceptGoals(
      {required String goalId, required String distinctId, String? uidType}) {
    return datasource.acceptGoals(
        distinctId: distinctId, goalId: goalId, uidType: uidType);
  }

  @override
  Future<UnacceptGoals> unacceptGoals(
      {required String distinctId, required String goalId, String? uidType}) {
    return datasource.unacceptGoals(
        distinctId: distinctId, goalId: goalId, uidType: uidType);
  }

  @override
  Future<GoalStatusInfo> getGoalStatus({
    required String token,
    required String goalId,
  }) {
    return datasource.getGoalStatus(token: token, goalId: goalId);
  }
}
