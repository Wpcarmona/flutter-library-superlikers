import '../participant/participant.dart';

/// La actividad de comentario recién creada/actualizada. Shape distinta a
/// [Comment] (la del listado): esta no trae `body`, en cambio sí trae
/// `votesCount`/`pushRedirectUrl`.
class CommentActivity {
  final String id;
  final String type;
  final int activityCount;
  final String atype;
  final String category;
  final String moderation;
  final int points;
  final String state;
  final int createdAt;
  final String module;
  final String name;
  final dynamic team;
  final Participant participant;
  final int votesCount;
  final List<String> tags;
  final List<String> participantsTags;
  final String? pushRedirectUrl;

  CommentActivity({
    required this.id,
    required this.type,
    required this.activityCount,
    required this.atype,
    required this.category,
    required this.moderation,
    required this.points,
    required this.state,
    required this.createdAt,
    required this.module,
    required this.name,
    required this.team,
    required this.participant,
    required this.votesCount,
    required this.tags,
    required this.participantsTags,
    this.pushRedirectUrl,
  });
}

/// Resultado de crear o actualizar un comentario (mismo shape para ambas
/// operaciones).
class CommentActivityResult {
  final String ok;
  final String activityState;
  final dynamic activityPoints;
  final String message;
  final String? executionError;
  final CommentActivity object;

  CommentActivityResult({
    required this.ok,
    required this.activityState,
    required this.activityPoints,
    required this.message,
    this.executionError,
    required this.object,
  });
}
