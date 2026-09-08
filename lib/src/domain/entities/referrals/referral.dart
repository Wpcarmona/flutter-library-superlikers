import '../participant/participant.dart';

/// Consultar o actualizar el propio código de referido del participante
/// autenticado (`POST /referrals/`: sin `code` consulta, con `code` lo
/// actualiza).
class ReferralCode {
  final String ok;
  final String code;

  ReferralCode({required this.ok, required this.code});
}

class Referral {
  final String code;
  final Participant owner;
  final String referredCode;
  final String referredUid;

  Referral({
    required this.code,
    required this.owner,
    required this.referredCode,
    required this.referredUid,
  });
}

class ParticipantReferrals {
  final String ok;
  final int page;
  final int pageSize;
  final int totalPages;
  final int totalData;
  final List<Referral> data;

  ParticipantReferrals({
    required this.ok,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.data,
  });
}
