import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class ParticipantMapper {
  static domain.Participant toEntity(infra.Participant participant) {
    return domain.Participant(
      id: participant.id,
      email: participant.email,
      name: participant.name,
      avatar: participant.avatar,
      uid: participant.uid,
      uidType: participant.uidType,
      state: participant.state,
      properties: participant.properties,
    );
  }

  static domain.ParticipantPublicInfo participantPublicInfoToEntity(
    infra.ParticipantPublicInfoResponse response,
  ) {
    final object = response.object;
    return domain.ParticipantPublicInfo(
      uid: object.uid,
      email: object.email,
      points: object.points,
      totalPoints: object.totalPoints,
      state: object.state,
      avatar: object.avatar,
      lastActivityAt: object.lastActivityAt,
      name: object.nombres,
      lastName: object.apellidos,
      cellphoneNumber: object.celular,
      idEmployed: object.idEmpleado,
      region: object.region,
      tienda: object.tienda,
      plaza: object.plaza,
      nombreTienda: object.nombreTienda,
      terms: object.terms,
      tags: List<String>.from(object.tags),
      rol: object.rol,
      cargo: object.cargo,
      nivel: object.nivel,
      emailVerified: object.emailVerified,
      fcmToken: object.fcm,
      autorizationNumber: object.autorizationNumber,
      isPublisher: object.isPublisher,
    );
  }

  static domain.AdvancedRanking participantRankToEntity(
    infra.ParticipantRankingResponse response,
  ) =>
      domain.AdvancedRanking(
        firstName: response.data.firstName,
        name: response.data.data.nombres,
        lastName: response.data.data.apellidos,
        votes: response.data.votes,
        points: response.data.points,
        rankingPoints: response.data.level,
        level: response.data.level,
        pointsByPtype: {},
        colour: response.data.colour,
        ranking: response.data.ranking,
        data: {},
      );

  static domain.UpdateAvatar updateAvatarToEntity(
    infra.UpdateParticipantAvatarResponse response,
  ) {
    return domain.UpdateAvatar(
      ok: response.ok,
      message: response.message,
    );
  }

  static domain.UpdateUser updateUserToEntity(
    infra.UpdateParticipantResponse response,
  ) {
    return domain.UpdateUser(
      ok: response.ok,
      message: response.message,
    );
  }

  static List<domain.Participant> participantListToEntity(
    infra.ParticipantListResponse response,
  ) {
    return response.data.map(toEntity).toList();
  }

  static domain.ParticipantPoints participantPointsToEntity(
    infra.ParticipantPointsResponse response,
  ) {
    final object = response.object;
    return domain.ParticipantPoints(
      ok: response.ok,
      totalPoints: object.totalPoints,
      points: object.points,
      redeemedPoints: object.redeemedPoints,
      pointsToExpire: object.pointsToExpire,
      expirationDate: object.expirationDate,
      expiredPoints: object.expiredPoints,
    );
  }

  static domain.RedeemPoints redeemPointsToEntity(
    infra.RedeemPointsResponse response,
  ) {
    return domain.RedeemPoints(ok: response.ok, message: response.message);
  }
}
