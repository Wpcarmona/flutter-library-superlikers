class ParticipantPublicInfo {
  final String uid;
  final String? uidType;
  final String email;
  final num points;
  final num totalPoints;
  final List<dynamic> coins;
  final List<dynamic> totalCoins;
  final String state;
  final bool badEmail;
  final bool emailVerified;
  final bool cellphoneVerified;
  final bool unconfirmedEmail;
  final bool unconfirmedCellphone;
  final String avatar;
  final DateTime lastActivityAt;
  final List<String> tags;

  /// Cualquier otro campo que el backend devuelva, tal cual vino del JSON.
  /// Este endpoint varía mucho de forma por campaign: un cliente manda
  /// `nombres`/`apellidos`/`celular`/`id_empleado`/`plaza`/`region`/
  /// `tienda`/`cargo`/`nivel`/`rol`/`fcm`; otro manda `nombre_completo`/
  /// `numero_de_documento`/`tipo_de_documento`/`numero_de_celular`/
  /// `aceptar_terminos`; otro manda `name`/`restaurante`/`sede`/
  /// `retos_aceptados`/`avatar_profile`/`fondo`. Cada app lee de aquí los
  /// campos que le correspondan a su propia campaign.
  final Map<String, dynamic> properties;

  ParticipantPublicInfo({
    required this.uid,
    this.uidType,
    required this.email,
    required this.points,
    required this.totalPoints,
    this.coins = const [],
    this.totalCoins = const [],
    required this.state,
    this.badEmail = false,
    required this.emailVerified,
    this.cellphoneVerified = false,
    this.unconfirmedEmail = false,
    this.unconfirmedCellphone = false,
    required this.avatar,
    required this.lastActivityAt,
    this.tags = const [],
    this.properties = const {},
  });
}
