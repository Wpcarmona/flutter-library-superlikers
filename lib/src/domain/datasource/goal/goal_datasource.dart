import '../../entities/entities.dart';

abstract class GoalDatasource {
  Future<List<IndexGoals>> getGoalsIndex({
    required bool enabled,
    required List<String> tags,
    num? page,
    num? limit,
    String? sponsorId,
    bool? trending,
    String? q,
  });

  Future<List<GoalsParticipant>> getGoalsParticipant({
    required String token,
    required List<String> tags,
    required String distictId,
    int page = 1,
  });

  Future<AcceptGoals> acceptGoals({
    required String distinctId,
    required String goalId,
    String? uidType,
  });

  Future<UnacceptGoals> unacceptGoals({
    required String distinctId,
    required String goalId,
    String? uidType,
  });

  Future<GoalStatusInfo> getGoalStatus({
    required String token,
    required String goalId,
  });
}
