/// Estado de avance de un participante en un goal puntual (`POST
/// /participants/goals/status`). No confundir con [GoalsParticipant], que
/// es el goal completo con sus condiciones.
class GoalStatusInfo {
  final String ok;
  final String name;
  final String status;
  final int winned;
  final List<String> winningDates;
  final String goalId;

  GoalStatusInfo({
    required this.ok,
    required this.name,
    required this.status,
    required this.winned,
    required this.winningDates,
    required this.goalId,
  });
}
