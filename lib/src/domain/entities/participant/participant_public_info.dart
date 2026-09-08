class ParticipantPublicInfo {
  final String uid;
  final String email;
  final num points;
  final num totalPoints;
  final String state;
  final bool emailVerified;
  final String avatar;
  final DateTime lastActivityAt;
  final String name;
  final String lastName;
  final String cellphoneNumber;
  final String idEmployed;
  final String region;
  final String tienda;
  final String plaza;
  final String? nombreTienda;
  final bool terms;
  final List<String> tags;
  final String? rol;
  final String cargo;
  final String nivel;
  final String? fcmToken;
  final String? autorizationNumber;
  final String? isPublisher;

  ParticipantPublicInfo({
    required this.uid,
    required this.email,
    required this.points,
    required this.totalPoints,
    required this.state,
    required this.avatar,
    required this.lastActivityAt,
    required this.name,
    required this.lastName,
    required this.cellphoneNumber,
    required this.idEmployed,
    required this.region,
    required this.tienda,
    required this.plaza,
    this.nombreTienda,
    required this.terms,
    required this.tags,
    this.rol,
    required this.cargo,
    required this.nivel,
    required this.emailVerified,
    this.fcmToken,
    this.autorizationNumber,
    this.isPublisher,
  });
}
