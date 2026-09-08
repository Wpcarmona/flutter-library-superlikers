import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class AcceptGoalMapper {
  static domain.AcceptGoals acceptGoalToEntity(infra.AcceptGoalsResponse acceptGoal) =>
      domain.AcceptGoals(ok: acceptGoal.ok, message: acceptGoal.message);
}
