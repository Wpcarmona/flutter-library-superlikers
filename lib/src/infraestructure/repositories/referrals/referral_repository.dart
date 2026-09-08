import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class ReferralRepositoryImpl extends ReferralRepository {
  final ReferralDatasource datasource;

  ReferralRepositoryImpl([ReferralDatasource? datasource])
      : datasource = datasource ?? ReferralDatasourceImpl();

  @override
  Future<ReferralCode> getOrUpdateReferralCode({
    required String token,
    String? code,
  }) {
    return datasource.getOrUpdateReferralCode(token: token, code: code);
  }

  @override
  Future<ParticipantReferrals> getParticipantReferrals({
    required String token,
    int? page,
    int? limit,
  }) {
    return datasource.getParticipantReferrals(token: token, page: page, limit: limit);
  }
}
