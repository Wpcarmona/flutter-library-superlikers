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

  /// [referralsCode] asigna el código de referido de quien invitó al
  /// participante (módulo Referidos), si no se envió al registrarse.
  ///
  /// [properties] actualiza cualquier otro campo del participante definido
  /// en el schema de la campaign (tags, avatar, campos propios, etc.). Los
  /// parámetros con nombre, si se envían, tienen prioridad sobre las mismas
  /// llaves en [properties].
  Future<UpdateUser> updateUser({
    required String token,
    required String distinctId,
    String? name,
    String? phone,
    String? cargo,
    String? fcmToken,
    String? autorizationNumber,
    String? referralsCode,
    Map<String, dynamic>? properties,
  });

  /// Busca participantes por [tags] (uso típico: admin/coordinador buscando
  /// participantes asociados). [withAdmins] incluye administradores en el
  /// resultado y [exactTags] exige que tengan exactamente esos tags.
  Future<List<Participant>> searchParticipants({
    required String token,
    List<String>? tags,
    bool? withAdmins,
    bool? exactTags,
  });

  Future<ParticipantPoints> getParticipantPoints({required String token});

  Future<RedeemPoints> redeemPoints({
    required String token,
    required num points,
  });
}
