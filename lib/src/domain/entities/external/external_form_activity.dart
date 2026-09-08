import '../participant/participant.dart';

/// Una instancia de "external form" ya llenada por un participante (no
/// confundir con [ExternalFormList], que es la acción/config disponible
/// para llenar). El backend agrega columnas libres según lo que la
/// campaign definió para ese form (ej. `valor`); esas quedan en
/// [properties], igual que [Participant.properties].
class ExternalFormActivity {
  final String id;
  final String type;
  final int activityCount;
  final String atype;
  final String? category;
  final String moderation;
  final num points;
  final String state;
  final int createdAt;
  final int executeDate;
  final String module;
  final String name;
  final dynamic team;
  final Participant participant;
  final Map<String, dynamic> properties;

  ExternalFormActivity({
    required this.id,
    required this.type,
    required this.activityCount,
    required this.atype,
    this.category,
    required this.moderation,
    required this.points,
    required this.state,
    required this.createdAt,
    required this.executeDate,
    required this.module,
    required this.name,
    required this.team,
    required this.participant,
    this.properties = const {},
  });
}

class ExternalFormActivityList {
  final String ok;
  final int page;
  final int pageSize;
  final int totalPages;
  final int totalData;
  final List<ExternalFormActivity> forms;

  ExternalFormActivityList({
    required this.ok,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.forms,
  });
}
