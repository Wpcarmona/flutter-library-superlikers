import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class UnacceptGoalMapper {
  static domain.UnacceptGoals unacceptGoalToEntity(
          infra.UnnacceptGoalsResponse unacceptGoal) =>
      domain.UnacceptGoals(ok: unacceptGoal.ok, message: unacceptGoal.message);
}
