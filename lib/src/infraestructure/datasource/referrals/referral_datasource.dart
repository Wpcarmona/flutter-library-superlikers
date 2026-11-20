
import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../../network/json_body.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class ReferralDatasourceImpl extends ReferralDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  @override
  Future<ReferralCode> getOrUpdateReferralCode({
    required String token,
    String? code,
  }) async {
    final response = await dio.post(
      '/microsite/referrals/',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'code': ?code,
      },
    );
    final responseData = decodeJsonBody(response);
    return ReferralMapper.referralCodeToEntity(ReferralCodeResponse.fromJson(responseData));
  }

  @override
  Future<ParticipantReferrals> getParticipantReferrals({
    required String token,
    int? page,
    int? limit,
  }) async {
    final response = await dio.post(
      '/microsite/referrals/participant_referrals',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'page': ?page,
        'limit': ?limit,
      },
    );
    final responseData = decodeJsonBody(response);
    return ReferralMapper.participantReferralsToEntity(
      ParticipantReferralsResponse.fromJson(responseData),
    );
  }
}
