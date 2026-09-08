import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;
import '../participant/participant_mapper.dart';

class ReferralMapper {
  static domain.ReferralCode referralCodeToEntity(infra.ReferralCodeResponse response) =>
      domain.ReferralCode(ok: response.ok, code: response.code);

  static domain.ParticipantReferrals participantReferralsToEntity(
    infra.ParticipantReferralsResponse response,
  ) =>
      domain.ParticipantReferrals(
        ok: response.ok,
        page: response.page,
        pageSize: response.pageSize,
        totalPages: response.totalPages,
        totalData: response.totalData,
        data: response.data
            .map(
              (r) => domain.Referral(
                code: r.code,
                owner: ParticipantMapper.toEntity(r.owner),
                referredCode: r.referredCode,
                referredUid: r.referredUid,
              ),
            )
            .toList(),
      );
}
