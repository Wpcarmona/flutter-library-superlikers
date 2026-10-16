import '../../entities/entities.dart';

abstract class ReferralDatasource {
  /// `POST /microsite/referrals/`. Sin [code] consulta el código de referido
  /// propio del participante autenticado; con [code] lo actualiza. El código
  /// se asigna solo al registrarse si el módulo ya estaba instalado.
  Future<ReferralCode> getOrUpdateReferralCode({
    required String token,
    String? code,
  });

  /// `POST /microsite/referrals/participant_referrals`. Lista los
  /// participantes que se registraron con el código del participante
  /// autenticado. [page] por defecto 1, [limit] por defecto 30.
  Future<ParticipantReferrals> getParticipantReferrals({
    required String token,
    int? page,
    int? limit,
  });
}
