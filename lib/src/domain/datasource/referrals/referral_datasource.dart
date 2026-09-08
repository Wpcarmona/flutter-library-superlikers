import '../../entities/entities.dart';

abstract class ReferralDatasource {
  /// Sin [code] consulta el código de referido actual del participante;
  /// con [code] lo actualiza.
  Future<ReferralCode> getOrUpdateReferralCode({
    required String token,
    String? code,
  });

  Future<ParticipantReferrals> getParticipantReferrals({
    required String token,
    int? page,
    int? limit,
  });
}
