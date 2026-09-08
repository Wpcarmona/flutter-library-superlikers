import '../../entities/entities.dart';

abstract class ParticipantRepository {
  Future<ParticipantPublicInfo> getParticipantPublicInfo({
    required String token,
  });

  Future<UpdateAvatar> updateAvatar({
    required String token,
    required String distinctId,
    required String url,
  });

  Future<AdvancedRanking> getParticipantRanking({
    required String apiKey,
    required String campaign,
    required String distinctId,
  });

  Future<UpdateUser> updateUser({
    required String token,
    required String distinctId,
    String? name,
    String? phone,
    String? cargo,
    String? fcmToken,
    String? autorizationNumber,
  });

  /// Busca participantes por [tags] (uso típico: admin/coordinador buscando
  /// participantes asociados).
  Future<List<Participant>> searchParticipants({
    required String token,
    List<String>? tags,
  });

  Future<ParticipantPoints> getParticipantPoints({required String token});

  Future<RedeemPoints> redeemPoints({
    required String token,
    required num points,
  });
}
